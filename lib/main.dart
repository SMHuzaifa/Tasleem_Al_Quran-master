// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tasleem_al_quran/admin_files/user_data.dart';
import 'package:tasleem_al_quran/calendar.dart';
import 'package:tasleem_al_quran/dashboard_files/courses.dart';
import 'package:tasleem_al_quran/about_us_files/Noreeba_effendi.dart';
import 'package:tasleem_al_quran/about_us_files/ayesha_jadoon.dart';
import 'package:tasleem_al_quran/about_us_files/iqra_asad.dart';

import 'package:tasleem_al_quran/dashboard_files/home.dart';
import 'package:tasleem_al_quran/dashboard_files/about_us.dart';

import 'package:tasleem_al_quran/about_us_files/saad_arshad.dart';
import 'package:tasleem_al_quran/about_us_files/sabah_malik.dart';

import 'package:tasleem_al_quran/namaz_timing_file/UI_file.dart';
import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc.dart';
import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc_check.dart';
import 'package:tasleem_al_quran/qibla_files/compass_file.dart';
import 'package:tasleem_al_quran/quran_files/main.dart';
import 'package:tasleem_al_quran/quran_files/screens/jus_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/qari_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/quran_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/surah_detail.dart';


import 'admin_files/admin_login_page.dart';

import 'dashboard_files/Register.dart';
import 'bottom_navigation_bar.dart';
import 'dashboard_files/fee_chart.dart';
import 'package:firebase_core/firebase_core.dart';





Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Future initialization(BuildContext context) async {
    await Future.delayed(const Duration(seconds: -1));
  }
  runApp(const MyApp());
}
Future initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: -1));
}



class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SplashScreen',
      home: const MyNavigationBar(),
      routes: {
        MyNavigationBar.id: (context) => const MyNavigationBar(),
        //MyMenue.id: (context) => MyMenue(),
        SaadArshad.id: (context) => const SaadArshad(),
        IqraAsad.id: (context) => const IqraAsad(),
        AyeshaJadoon.id: (context) => const AyeshaJadoon(),
        SabahMalik.id: (context) => const SabahMalik(),
        NoreebaEffendi.id: (context) => const NoreebaEffendi(),
        Home.id: (context) => const Home(),
        OurTeam.id: (context) => const OurTeam(),
        Courses.id: (context) => const Courses(),
        Fee.id: (context) => const Fee(),
        Register.id: (context) => const Register(),
        Compass.id: (context) =>  Compass(),
        PrayTimes.id: (context) => PrayTimes(),
        //Calendar.id: (context) =>  Calendar(),
        UserData.id: (context) => const UserData(),
        AdminPage.id: (context) => const AdminPage(),
        NamazLoc.id: (context) => NamazLoc(),
        NamazLoccheck.id: (context) => const NamazLoccheck(),
        Quran.id: (context) => const Quran(),
      //  QiblahScreen.id: (context) => QiblahScreen(),
        QariListScreen.id:(context) => const QariListScreen(),
        QuranScreen.id:(context) => const QuranScreen(),
        JuzScreen.id: (context) => const JuzScreen(),
        Surahdetail.id: (context) => const Surahdetail(),


      },
    );
  }
}
