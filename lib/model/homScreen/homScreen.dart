
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefortynuclear/cubit/cubit.dart';
import 'package:thefortynuclear/cubit/states.dart';
import 'package:thefortynuclear/model/Home2/home2.dart';
import 'package:thefortynuclear/model/home1/home1.dart';
import 'package:thefortynuclear/model/home3/home3.dart';
import 'package:thefortynuclear/sherad/Text/text.dart';


class ItemHome{
  late final String text;
  late final String image;
  late final  String image2;
  late final  String text2;
  late final  Color color1;
  late final  Color color2;


  ItemHome({
    required this.text,
    required this.image,
    required this.image2,
    required this.text2,
    required this.color1,
    required this.color2,

});


}





// ignore: must_be_immutable
class HomScreen extends StatelessWidget {
   HomScreen({Key? key}) : super(key: key);


  List<ItemHome>items=[
    ItemHome(text: 'الاحاديث الاربعين', image: 'assets/quran.png', image2: 'assets/svg/Subtraction 7.svg', text2: '1',color1:const Color(0xff49C649),color2: const Color(0xff336325) ),
    ItemHome(text: 'الاستماع الاحاديث', image: 'assets/play.png', image2: 'assets/svg/Subtraction 7.svg', text2: '2',color1:const Color(0xffecb24c),color2: const Color(0xffc56683) ),
    ItemHome(text: 'الاحاديث المحفوظة', image: 'assets/save-instagram.png', image2: 'assets/svg/Subtraction 7.svg', text2: '3',color1:const Color(0xffB42C2C),color2: const Color(0xff422563)),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,Home1State>(
      listener: (context,state){},
      builder: (context,state) {

        return Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SvgPicture.asset('assets/svg/background.svg',fit: BoxFit.cover,width:double.infinity,height: double.infinity ,),
              Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height:80.0),
                  SvgPicture.asset('assets/svg/logo.svg'),
                  const SizedBox(height:20.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextApp.textHome1,
                          const SizedBox(height:5.0),
                          TextApp.textHome2,
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: AlignmentDirectional.center,
                              child: ListView(
                                shrinkWrap: true,
                                children:
                                List.generate(items.length, (index) => buildItem(items[index],context,index)),

                              ),


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


  Widget buildItem(ItemHome item,context,index){
    return   InkWell(
      onTap: (){
        if(index==0){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Home1()));
        }
        else if(index==1){
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const Home2()));
        }else if(index == 2){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Home3()));
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 10.0,
          bottom: 46.0,
          //top: 10.0,
        ),
        child: Container(
          height: 117,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [item.color1,item.color2],
              end:AlignmentDirectional.topStart ,
              begin: AlignmentDirectional.topEnd,
            ),

            borderRadius: BorderRadius.circular(10.0),
          ),
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(item.image,fit: BoxFit.cover,),
              ),
              Text(item.text,style:GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize:22.0 ) ,),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(item.image2),
                    Text(item.text2,style: const TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.w900),),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
    
  } 

  
}
