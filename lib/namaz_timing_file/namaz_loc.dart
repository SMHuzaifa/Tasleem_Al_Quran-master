import 'package:flutter/material.dart';

import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc_check.dart';




class NamazLoc extends StatefulWidget {
  static String id = "NamazLoc";
  @override
  _NamazLoc createState() => _NamazLoc();
}

class _NamazLoc extends State<NamazLoc> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(

          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
            if (snapshot.data!) {
              return NamazLoccheck();
            } else {
              return const Center(
                child: Text("Your device is not supported"),
              );
            }
          },
        ),
      ),
    );
  }
}