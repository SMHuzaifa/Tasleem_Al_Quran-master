import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasleem_al_quran/quran_files/screens/jus_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/main_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/surah_detail.dart';
import 'package:tasleem_al_quran/splash_screen.dart';

import 'constants/constants.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   runApp(const MyApp());
// }

class Quran extends StatefulWidget {
  static String id = "Quran";
  const Quran({Key? key}) : super(key: key);

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Soul',
      theme: ThemeData(
          primarySwatch: Constants.kSwatchColor,
          primaryColor: Constants.kPrimary,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins'),
      home: const MainScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        Surahdetail.id: (context) => const Surahdetail(),
      },

    );
  }
}
