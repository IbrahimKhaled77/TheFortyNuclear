


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:thefortynuclear/cubit/states.dart';
import 'package:thefortynuclear/models/api.dart';
import 'package:thefortynuclear/models/home1.dart';

class HomeCubit extends Cubit<Home1State>{
  HomeCubit():super(InitalState());

  static HomeCubit get(context)=>BlocProvider.of(context);


  int currentIndex=0;
  List<BottomNavigationBarItem> itemBottom=const [
    BottomNavigationBarItem(
      label: '',
      icon:Icon(Icons.book_outlined,),
    ),
    BottomNavigationBarItem(
      label: '',
      icon:Icon(Icons.library_books_outlined,),
    ),
    BottomNavigationBarItem(
      label: '',
      icon:Icon(Icons.collections_bookmark_outlined,),
    ),
    BottomNavigationBarItem(
      label: '',
      icon:Icon(Icons.volume_up_outlined,),
    ),

  ];

  void changeNavigationBarItems(int index){
    if(index==3){
      emit(ChangeNavigationBarItemsSuccessAudioStates());
    }else{
      currentIndex=index;
      emit(ChangeNavigationBarItemsSuccessStates());
    }

  }

  void shareFloatingActionButton(Data model){
    if(currentIndex==0) {
      Share.share(model.textHadith!);
    }else if(currentIndex==1){
      Share.share(model.explanationHadith!);
    }else if(currentIndex==2){
      Share.share(model.translateNarrator!);

    }
    emit(ShareFloatingActionButtonSuccessStates());
  }

  Hadith? hadith;
  Map<String,bool>fa={};
  List<bool>a=[];


  void getHadi( )  {
    // {fas=false}
    emit(LoadingGetHadiState());
    try{
      hadith=  Hadith.fromJson(data);
    /*  hadith!.data!.forEach((element) {
        element.fa=fas;
      });*/
      for (var element in hadith!.data!) {
        fa.addAll({
          element.nameHadith!:element.fa!,
        });
      }
      emit(SuccessGetHadiState());
    }catch(error){
      emit(ErrorGetHadiState(error.toString()));
    }




  }
//مش صح بس لانه ماعندي api جاهز
  void likesCreat( Data model){
    model.fa=!model.fa!;
    fa[model.nameHadith!]=!fa[model.nameHadith]!;
    try{

      emit(LikeSuccessState());

      //getHadi(fas: model.fa);
      //model.fa=true;



      // fa[model.nameHadith!]=!fa[model.nameHadith]!;
    }catch(error){
      model.fa=!model.fa!;
      fa[model.nameHadith!]=!fa[model.nameHadith]!;
      emit(LikeErorrState());
    }






  }



  RichText convertHadith(BuildContext context, String text) {
    text = text.replaceAll('(', '{');
    text = text.replaceAll(')', '}');

    List<String> split = text.split(RegExp("\\{"));

    List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
      List<String> texts = e.split(RegExp("\\}"));
      if (texts.length > 1) {
        return List.from(t)
          ..addAll(
              ["\n{${texts.first}} \n", (e.substring(texts.first.length + 1))]);
      }
      return List.from(t)..add("\n{${texts.first}");
    });

    return RichText(
      textAlign: TextAlign.right,

      text: TextSpan(
        style: const TextStyle(fontSize: 20, color: Colors.brown),
        // style: DefaultTextStyle.of(context).style,
        children: [

          TextSpan(text: split.first,style: GoogleFonts.tajawal(
          color: const Color(0xff49C649),
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        )), ...hadiths
            .map((text) => text.contains("{")
            ? TextSpan(text: text, style: GoogleFonts.tajawal(color: const Color(0xffFFD434), fontSize: 20.0, fontWeight: FontWeight.bold,))
            : TextSpan(text: text,style: GoogleFonts.tajawal(color: const Color(0xff888888), fontSize: 18.0, fontWeight: FontWeight.normal,)))
            .toList()
        ],
      ),
      textDirection: TextDirection.rtl,
    );
  }

 // static final  AudioPlayer audioPlayer =AudioPlayer();


/*
  static final  AudioPlayer audioPlayer =AudioPlayer();

  final  AudioCache audioCache=AudioCache(fixedPlayer:audioPlayer );

  bool play=false;

  //audioCache.fixedPlayer.audioPlayer.setReleaseMode(ReleaseMode.STOP);

  Duration duration=const Duration();
  Duration position=const Duration();

  void playAudio()
  {
    //audioPlayer.setReleaseMode(ReleaseMode.RELEASE);

    audioPlayer.onDurationChanged
        .listen((event) {
      duration=event;
      emit(OnDurationChangedSuccessStates());
    })
        .onError((eroo){
      if (kDebugMode) {
        print(eroo.toString());
      }
      emit(OnDurationChangedErorrStates());
    });

    audioPlayer.onAudioPositionChanged.listen((value) {
      position=value;
      emit(OnPositionChangedSuccessStates());
    }).onError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(OnPositionChangedErorrStates());
    });

  }


  void addAudio(){
    if(position < duration - const Duration(seconds: 5)){
      seekPlay(position.inSeconds +5);
    }else{
      seekPlay(duration.inSeconds);
      audioPlayer.stop();
      //play=false;
    }
    emit(AddSuccessStates());
  }

  void minus(){
    if(position.inSeconds ==0 || position.inSeconds<5){
      seekPlay(0);
    }else{
      seekPlay(position.inSeconds - 5);
    }
    emit(MinusSuccessStates());
  }
IconData icons=Icons.play_arrow_outlined;
  void stop(){
    play=!play;
    icons=Icons.play_arrow_outlined;
    audioPlayer.pause();
    emit(StopAudioSuccessStates());
  }

  void stopEnd(){
  //  play=!play;
    icons=Icons.play_arrow_outlined;
    audioPlayer.stop();
    position=Duration.zero;
    emit(StopEndSuccessStates());

  }

  void playAudios(fileName)  async{
    play=!play;
    icons=Icons.stop_outlined;
    //audioPlayer.play(url)
    //var source=File('assets/${fileName}') as Source;

   // audioPlayer.play('C:/Users/LENOVO/Downloads/nawawi01.mp3');
    audioCache.play(fileName);
    audioCache.load(fileName);
    HomeCubit.audioPlayer.setVolume(1.0);
    emit(PlayAudioSuccessStates());
  }

  void seekPlay(int value){
    Duration newDuration=Duration(seconds: value);
    emit(SeekPlaySuccessStates());
      audioPlayer.seek(newDuration);

  }
*/

bool? isplay=false;
IconData icons=Icons.play_arrow_outlined;
late  AudioPlayer player;
 late  AssetSource path;

Duration duration= const Duration();
  Duration position= const Duration();

 Future<void> initalPlay( String localAudio) async{
  emit(InitalPlaySuccessStates());
  player= AudioPlayer();
  path=AssetSource(localAudio);
  duration=Duration.zero;
  position=Duration.zero;
  isplay=false;

  player.onDurationChanged.listen((event) {
    duration=event;
    emit(OnDurationChangedSuccessStates());
  }).onError((error){
    emit(OnDurationChangedErorrStates());
  });

  player.onPositionChanged.listen((event) {
    position=event;
    emit(OnPositionChangedSuccessStates());
  }).onError((error){
    emit(OnPositionChangedErorrStates());
  });

  player.onPlayerComplete.listen((event) {
    position=duration;
    player.stop();
    isplay=false;
    icons=Icons.play_arrow_outlined;
    emit(OnPlayerCompleteSuccessStates());
  }).onError((error){
    emit(OnPlayerCompleteErrorStates());
  });
}


void seekPlay(value){
  Duration newDuration= Duration(seconds:value);
  player.seek(newDuration);
  emit(SeekPlaySuccessStates());
}

void endPlay(){
player.stop();
isplay=false;
icons=Icons.play_arrow_outlined;
emit(StopEndSuccessStates());



}


void stopPlayer(){
  if(isplay!){
    player.pause();
    isplay=false;
    icons=Icons.play_arrow_outlined;
    emit(StopAudioSuccessStates());
  }else{
    player.play(path);
    isplay=true;
    icons=Icons.stop_outlined;
    emit(PlayAudioSuccessStates());
  }
}

void addAudio(){
  seekPlay( position.inSeconds+5);
  emit(AddSuccessStates());
}

void minus(){
  seekPlay( position.inSeconds-5);
  emit(MinusSuccessStates());
}






}