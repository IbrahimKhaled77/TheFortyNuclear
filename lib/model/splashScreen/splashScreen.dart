import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thefortynuclear/model/homScreen/homScreen.dart';
import 'package:thefortynuclear/sherad/Text/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Timer(const Duration(seconds: 3), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>HomScreen()) ));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            'assets/svg/splash.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/islamic.svg',
                fit: BoxFit.cover,

              ),
             const SizedBox(height:10.0 ,),
              TextApp.textSplash
            ],
          ),

        ],
      ),
    );
  }
}
