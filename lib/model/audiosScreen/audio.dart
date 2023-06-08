import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefortynuclear/cubit/cubit.dart';
import 'package:thefortynuclear/cubit/states.dart';
import 'package:thefortynuclear/models/home1.dart';
import 'package:thefortynuclear/sherad/Icon/icons.dart';

// ignore: must_be_immutable
class Audio extends StatelessWidget {


  Data model;
 final String localAudio;

  Audio({super.key,
    required this.model,
    required this.localAudio,
  });



  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
     // HomeCubit.get(context).playAudio();
     //  HomeCubit.get(context).play;
        //HomeCubit.get(context).initalPlay(localAudio);
        HomeCubit.get(context).initalPlay(localAudio);

        return BlocConsumer<HomeCubit, Home1State>(
            listener: (context, state) {
              if(state is ChangeNavigationBarItemsSuccessAudioStates){

              }

              if (kDebugMode) {
                print(localAudio);
              }
            },
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return Scaffold(
                body: Stack(
                  children: [
                    SvgPicture.asset('assets/svg/background.svg', fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 80.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 23.0),
                                    child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: SvgPicture.asset(
                                            'assets/svg/logo.svg')),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: InkWell(
                                      onTap: () {
                                        cubit.endPlay();
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svg/arrow-right.svg',)),
                                ),

                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${model.nameHadith}',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff49C649),

                                  ),),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    top: 65.0,
                                   // end: 10.0,
                                    start:20.0,
                                    bottom: 10.0,
                                  ),
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/svg/Group 31.svg',fit: BoxFit.cover,),
                                     const SizedBox(height: 32,),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: (){},
                                              icon: const Icon(
                                                IconBroken.Heart,
                                                size: 40.0,
                                                color:  Color(0xff888888),
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
                                      const SizedBox(height: 29,),
                                      Slider(
                                          activeColor: const Color(0xffFFD434),
                                            inactiveColor: const Color(0xffC9C9C9),
                                            max: cubit.duration.inSeconds.toDouble(),
                                            min: 0.0,
                                            value: cubit.position.inSeconds.toDouble(),
                                            onChanged: (value){
                                            cubit.seekPlay(value.toInt());

                                            },
                                        ),
                                      const SizedBox(height: 39,),
                                      Row(
                                        children: [
                                          Expanded(child: InkWell(
                                              onTap: (){
                                                cubit.minus();
                                              },
                                              child: SvgPicture.asset('assets/svg/Icon feather-skip-back.svg'))),
                                          Expanded(child: InkWell(
                                              onTap: (){
                                             /*   if(!cubit.play){
                                                  cubit.playAudios(localAudio);
                                                }else if(cubit.play){
                                                  cubit.stop();
                                                }
*/
                                              cubit.stopPlayer();
                                              },
                                              child:cubit.isplay! ?Icon(cubit.icons,size: 50.0,color: Colors.black.withOpacity(0.8),):Icon(cubit.icons,size: 50.0,color: Colors.black.withOpacity(0.8),) )),
                                          Expanded(child: InkWell(
                                              onTap: (){
                                               cubit.addAudio();

                                              },
                                              child: SvgPicture.asset('assets/svg/Icon feather-skip-forward.svg'))),
                                        ],
                                      ),

                              ],
                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              );
            }
        );
      }
    );
  }

}
