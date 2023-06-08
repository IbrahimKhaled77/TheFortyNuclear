import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefortynuclear/cubit/cubit.dart';
import 'package:thefortynuclear/cubit/states.dart';
import 'package:thefortynuclear/model/audiosScreen/audio.dart';
import 'package:thefortynuclear/models/home1.dart';
import 'package:thefortynuclear/sherad/Icon/icons.dart';

// ignore: must_be_immutable
class Sub1 extends StatelessWidget {


  Data model;
  int index;
  Sub1({super.key,
    required this.model,
    required this.index,
});



  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        HomeCubit.get(context).currentIndex=0;
        return BlocConsumer<HomeCubit,Home1State>(
          listener: (context,state){
            if(state is ChangeNavigationBarItemsSuccessAudioStates){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Audio(model:model,localAudio: 'audio/${model.audioHadith}' ,)));
            }

          },
          builder: (context,state) {
            var cubit=HomeCubit.get(context);
            return Scaffold(
              body: Stack(
                children: [
                  SvgPicture.asset('assets/svg/background.svg',fit: BoxFit.cover,width:double.infinity,height: double.infinity ,),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height:80.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 23.0),
                                child: Align(
                                    alignment: AlignmentDirectional.center,
                                    child: SvgPicture.asset('assets/svg/logo.svg')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset('assets/svg/arrow-right.svg',)),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height:20.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0,left: 20.0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: (){
                                     cubit.likesCreat(model);
                                      },
                                      icon:  Icon(
                                          IconBroken.Heart,
                                        size: 40.0,
                                        color:model.fa==false?const Color(0xff888888):Colors.red,
                                      )),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('${model.key}',
                                        style: GoogleFonts.tajawal(
                                        fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff2D2D2D),

                                      ),),
                                      const SizedBox(height: 10.0,),
                                      Text('${model.nameHadith}',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff49C649),

                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                               if(cubit.currentIndex==0)
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: 65.0,
                                  start:20.0,
                                //  end: 10.0,
                                  bottom: 10.0,
                                ),
                                child: cubit.convertHadith(context,model.textHadith!),
                              ),
                              if(cubit.currentIndex==1)
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    top: 65.0,
                                  //  end: 10.0,
                                    start:20.0,
                                    bottom: 10.0,
                                  ),
                                  child: cubit.convertHadith(context,model.explanationHadith!),
                                ),
                              if(cubit.currentIndex==2)
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    top: 65.0,
                                    //end: 10.0,
                                    start:20.0,
                                    bottom: 10.0,
                                  ),
                                  child: cubit.convertHadith(context,model.translateNarrator!),
                                ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor:Colors.white ,
                elevation: 0.0,
                selectedItemColor:const Color(0xff49C649),
                unselectedItemColor:const Color(0xff888888) ,
                items: cubit.itemBottom,
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeNavigationBarItems(index);
                },
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: (){

                  cubit.shareFloatingActionButton(model);
                },
                child: const Icon(Icons.share_outlined,color: Color(0xff888888),),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
            );
          }
        );
      }
    );
  }















}
