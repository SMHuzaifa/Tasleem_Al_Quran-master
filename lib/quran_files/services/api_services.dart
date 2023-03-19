import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/aya_of_the_day.dart';
import '../models/juz.dart';
import '../models/qari.dart';
import '../models/sajda.dart';
import '../models/surah.dart';
import '../models/translation.dart';

class ApiServices{

  final endPointUrl ="http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<AyaOfTheDay> getAyaOfTheDay() async {

    // for random Aya we need to generate random number
    // (1,6237) from 1 to 6236
    // Random Aya
    String url = "https://api.alquran.cloud/v1/ayah/${random(1,6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
        return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {

      throw Exception("Failed  to Load Post");
    }
  }
  random(min, max){
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async{

    Response res = await http.get(Uri.parse(endPointUrl));
    if(res.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element){
        if(list.length<114) {
          list.add(Surah.fromJson(element));
        }
      });

      return list;
    }else{
      throw ("Can't get the Surah");
    }
  }

  Future<SajdaList> getSajda() async {
    String url =   "http://api.alquran.cloud/v1/sajda/en.asad";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return SajdaList.fromJSON(json.decode(response.body));
    } else {

      throw Exception("Failed  to Load Post");
    }
  }

  Future<JuzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return JuzModel.fromJSON(json.decode(response.body));
    } else {

      throw Exception("Failed  to Load Post");
    }
  }

  Future<SurahTranslationList> getTranslation(int index , int translationIndex) async{

    String lan = "";
    if(translationIndex == 0){
      lan = "urdu_junagarhi";
    }else if(translationIndex == 1){
      lan = "hindi_omari";
    }else if(translationIndex == 2){
      lan = "english_saheeh";
    }else if(translationIndex == 3){
      lan = "spanish_garcia";
    }

    final url = "https://quranenc.com/api/translation/sura/$lan/$index";
    var res = await http.get(Uri.parse(url));

    return SurahTranslationList.fromJson(json.decode(res.body));
  }



  // Future<List<Qari>> getQariList() async {
  //   const url = "https://quranicaudio.com/api/qaris";
  //   final res = await http.get(Uri.parse(url));
  //
  //   final qarilist = <Qari>[];
  //   final decodedJson = jsonDecode(res.body) as List<dynamic>;
  //   decodedJson.take(20).forEach((element) {
  //     qarilist.add(Qari.fromJson(element));
  //   });
  //
  //   qarilist.sort((a, b) => a.name!.join(' ').compareTo(b.name!.join(' ')));
  //   return qarilist;
  // }



  //
  // Future<List<Qari>> getQariList() async {
  //   const url = "https://quranicaudio.com/api/qaris";
  //   final res = await http.get(Uri.parse(url));
  //
  //   final qarilist = <Qari>[];
  //   final decodedJson = jsonDecode(res.body) as List<dynamic>;
  //   decodedJson.take(50).forEach((element) {
  //     final qari = Qari.fromjson(element);
  //     final imageName = qari.name!.toLowerCase().replaceAll(' ', '_') + ".jpg";
  //     final imagePath = "assets/images/qaris/$imageName";
  //     final imageFile = File(imagePath);
  //     if (imageFile.existsSync()) {
  //       qari.image = Image.asset(imagePath);
  //     }
  //     qarilist.add(qari);
  //   });
  //   qarilist.sort((a, b) => (a.name! + " " + b.name!).compareTo(b.name! + " " + a.name!));
  //  // qarilist.sort((a, b) => a.name!.join(' ').compareTo(b.name!.join(' ')));
  //   return qarilist;
  // }
















  List<Qari> qarilist = [];

  Future<List<Qari>> getQariList() async {

    const url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));

    jsonDecode(res.body).forEach((element){
      if(qarilist.length<=161) {
        qarilist.add(Qari.fromjson(element));
      }

    });


    qarilist.sort((a,b)=>a.name!.compareTo(b.name!)); // sort according to A B C
    return qarilist;
  }
}