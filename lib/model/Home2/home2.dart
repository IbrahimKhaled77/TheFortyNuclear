
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefortynuclear/cubit/cubit.dart';
import 'package:thefortynuclear/cubit/states.dart';
import 'package:thefortynuclear/model/audiosScreen/audio.dart';
import 'package:thefortynuclear/models/home1.dart';
import 'package:thefortynuclear/sherad/Text/text.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,Home1State>(
        listener: (context,state) {},
        builder: (context,state) {
          var model=HomeCubit.get(context).hadith;

          return Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SvgPicture.asset('assets/svg/background.svg',fit: BoxFit.cover,width:double.infinity,height: double.infinity ,),
                Column(
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
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextApp.textHome11,
                            Expanded(
                              flex: 2,
                              child:GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1/1,
                                physics: const BouncingScrollPhysics(),
                                children: List.generate(model!.data!.length, (index) =>buildItem(model.data![index],context,index) ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );


  }


  Widget buildItem(Data model,context,index){
    return   InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Audio(model: model, localAudio: 'audio/${model.audioHadith}')));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(

          alignment: AlignmentDirectional.center,

          children: [
            Stack(
              children: [
                Image.asset('assets/img.png',fit: BoxFit.cover,),
                SvgPicture.asset('assets/svg/grey.svg',fit: BoxFit.cover),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${model.key}',style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color(0xffFFD434),
                ),),
                const SizedBox(height: 5.0,),
                Text('${model.nameHadith}',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.4,

                    color: const Color(0xffFFD434),
                  ),),
              ],
            ),
          ],
        ),
      ),
    );
  }



}
