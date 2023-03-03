import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/about_us_files/Noreeba_effendi.dart';
import 'package:tasleem_al_quran/about_us_files/ayesha_jadoon.dart';
import 'package:tasleem_al_quran/about_us_files/iqra_asad.dart';
import 'package:tasleem_al_quran/about_us_files/saad_arshad.dart';
import 'package:tasleem_al_quran/about_us_files/sabah_malik.dart';
import 'package:tasleem_al_quran/admin_files/admin_login_page.dart';
import 'package:tasleem_al_quran/admin_files/user_data.dart';
import 'package:tasleem_al_quran/not_used_files/bottom_navigation_bar.dart';

import 'package:tasleem_al_quran/namaz_timing_file/UI_file.dart';
import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc.dart';
import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc_check.dart';
import 'package:tasleem_al_quran/util/persistant_bottom.dart';
import 'package:tasleem_al_quran/qibla_files/compass_file.dart';
import 'package:tasleem_al_quran/quran_files/models/qari.dart';
import 'package:tasleem_al_quran/quran_files/screens/audio_surah_list_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/jus_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/qari_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/quran_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/surah_detail.dart';
import 'package:tasleem_al_quran/util/routes_name.dart';

import '../bottom_navigation_files/Register.dart';
import '../bottom_navigation_files/about_us.dart';
import '../bottom_navigation_files/courses.dart';
import '../bottom_navigation_files/fee_chart.dart';
import '../bottom_navigation_files/home.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      case RoutesName.persistBottom:
        return MaterialPageRoute(builder: (context) => const PersistBottom());

      case RoutesName.saadArshad:
        return MaterialPageRoute(builder: (context) => const SaadArshad());

      case RoutesName.iqraAsad:
        return MaterialPageRoute(builder: (context) => const IqraAsad());

      case RoutesName.ayeshaJadoon:
        return MaterialPageRoute(builder: (context) => const AyeshaJadoon());

      case RoutesName.sabahMalik:
        return MaterialPageRoute(builder: (context) => const SabahMalik());

      case RoutesName.noreebaEffendi:
        return MaterialPageRoute(builder: (context) => const NoreebaEffendi());

      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const Home());

      case RoutesName.ourTeam:
        return MaterialPageRoute(builder: (context) => const OurTeam());

      case RoutesName.courses:
        return MaterialPageRoute(builder: (context) => const Courses());

      case RoutesName.fee:
        return MaterialPageRoute(builder: (context) => const Fee());

      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => const Register());

      case RoutesName.compass:
        return MaterialPageRoute(builder: (context) => Compass());

      case RoutesName.prayTimes:
        return MaterialPageRoute(builder: (context) => PrayTimes());

      case RoutesName.userData:
        return MaterialPageRoute(builder: (context) => const UserData());

      case RoutesName.adminPage:
        return MaterialPageRoute(builder: (context) => const AdminPage());

      case RoutesName.namazLoc:
        return MaterialPageRoute(builder: (context) => NamazLoc());

      case RoutesName.namazLocCheck:
        return MaterialPageRoute(builder: (context) => const NamazLoccheck());

      case RoutesName.qariListScreen:
        return MaterialPageRoute(builder: (context) => const QariListScreen());

      case RoutesName.quranScreen:
        return MaterialPageRoute(builder: (context) => const QuranScreen());

      case RoutesName.juzScreen:
        return MaterialPageRoute(builder: (context) => const JuzScreen());

      case RoutesName.surahDetails:
        return MaterialPageRoute(builder: (context) => const Surahdetail());

      // case RoutesName.audioSurahListScreen:
      //   if(args is Qari)
      //   return MaterialPageRoute(builder: (context) =>   AudioSurahListScreen(qari: args ));
      //   break;

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          );
        });
    }
    // return MaterialPageRoute(builder: (context)=> Text("Error"));
  }

}
