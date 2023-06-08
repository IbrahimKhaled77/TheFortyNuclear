
class Hadith{
  List<Data>?data=[];


  Hadith ({
   this.data,
  });

  //to receive the data we need to pass it from Map to json
  //para recibir los datos necesitamos pasarlo de Map a json
   Hadith.fromJson(Map<String, dynamic> json) {
   json['data'].forEach((e){
     data!.add(Data.fromJson(e));
   });

   }


  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map




}


class Data {
  late final  String? key;
  late final String? nameHadith;
  late final String? textHadith;
  late final String? explanationHadith;
  late final String? translateNarrator;
  late final String? audioHadith;
    bool? fa;


  Data ({
    this.key,
    this.nameHadith,
    this.textHadith,
    this.explanationHadith,
    this.translateNarrator,
    this.audioHadith,
    this.fa,
  });
  Data.fromJson(Map<String, dynamic> json) {
    key=json["key"];
    nameHadith=json["nameHadith"];
    textHadith=json["textHadith"];
    explanationHadith=json["explanationHadith"];
    translateNarrator=json["translateNarrator"];
    audioHadith=json["audioHadith"];
    fa=json["fa"];

  }

  Map<String, dynamic> toMap() => {
    "key":key,
    "nameHadith":nameHadith,
    "textHadith":textHadith,
    "explanationHadith":explanationHadith,
    "translateNarrator":translateNarrator,
    "audioHadith":audioHadith,
    "fa":fa,
  };



}