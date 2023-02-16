import 'dart:convert';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:tasleem_al_quran/namaz_timing_file/UI_file.dart';

import 'package:http/http.dart';

import 'data_file.dart';

class JsonConnection {
  late double? pLat;
  late double? pLong;

  late Data? list;

  Future getPTLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);

      pLat = position.latitude;
      pLong = position.longitude;

      String date = DateTime.now().toString();
      int method = 4;

      final url =
          "https://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";

      Response response = await get(Uri.parse(url.toString()));
      final data = jsonDecode(response.body);

      list = Data.fromJson(data);
      return list;
    } catch (e) {
      print(e);
    }
  }
}
