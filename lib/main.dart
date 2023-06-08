import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:thefortynuclear/cubit/cubit.dart';
import 'package:thefortynuclear/model/splashScreen/splashScreen.dart';
import 'package:thefortynuclear/sherad/blocobserve/blocobserve.dart';
import 'package:thefortynuclear/sherad/sharedpreferences.dart';
void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=const SimpleBlocObserver();
  await SharedPreference.initial();


  runApp(const  MyApp());
}

class MyApp extends StatelessWidget {



  // This widget is the root of your application.


 const MyApp({super.key});@override
  Widget build(BuildContext context) {

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit()..getHadi()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          sliderTheme: const SliderThemeData(
              trackHeight: 5,
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 10,
            ),
          ),
        ),

        title: 'Flutter Demo',
        home: const SplashScreen(),
      ),
    );
  }
}


