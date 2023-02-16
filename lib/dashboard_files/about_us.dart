import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/bottom_navigation_bar.dart';

import 'package:tasleem_al_quran/about_us_files/Noreeba_effendi.dart';

import 'package:tasleem_al_quran/about_us_files/iqra_asad.dart';

import 'package:tasleem_al_quran/about_us_files/saad_arshad.dart';
import 'package:tasleem_al_quran/about_us_files/sabah_malik.dart';
import 'package:tasleem_al_quran/slide_images.dart';

import '../about_us_files/ayesha_jadoon.dart';
import 'home.dart';

class OurTeam extends StatefulWidget {
  static String id = "OurTeam_id";

  const OurTeam({super.key});

  @override
  State<OurTeam> createState() => _OurTeamState();
}

class _OurTeamState extends State<OurTeam> {

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);
    Navigator.pushNamed(context, MyNavigationBar.id); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tasleem Al-Quran Academy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
        //automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        tooltip: 'Contact Us',
        child: Image.asset('assets/WhatsApp.png'),
        onPressed: () {
          openWhatsapp();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
                width: 360,
                child: SlideImage(),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'Our Team',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(10, 91, 144, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              CircleAvatar(
                radius: 100,
                backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                child: CircleAvatar(
                  radius: 97,
                  backgroundImage: const AssetImage('assets/SaadArshadpic.jpg'),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SaadArshad.id);
                    },
                  ),
                ),
              ),
              const Text(
                'Saad Arshad',
                style: TextStyle(
                    color: Color.fromRGBO(10, 91, 144, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              //Text('"Team Manager"')
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: CircleAvatar(
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                    radius: 97,
                    backgroundImage: const AssetImage('assets/iqrasaad.png'),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, IqraAsad.id);
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Iqra Saad',
                style: TextStyle(
                    color: Color.fromRGBO(10, 91, 144, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: CircleAvatar(
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                    radius: 97,
                    backgroundImage:
                        const AssetImage('assets/ayeshajadoon.jpg'),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AyeshaJadoon.id);
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Ayesha Jadoon',
                style: TextStyle(
                    color: Color.fromRGBO(10, 91, 144, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: CircleAvatar(
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                    radius: 97,
                    backgroundImage: const AssetImage('assets/sabahmalik.jpg'),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SabahMalik.id);
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Sabah Malik',
                style: TextStyle(
                    color: Color.fromRGBO(10, 91, 144, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: CircleAvatar(
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                    radius: 97,
                    backgroundImage:
                        const AssetImage('assets/Noreebaeffendi.jpeg'),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, NoreebaEffendi.id);
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Noreeba Effendi',
                style: TextStyle(
                    color: Color.fromRGBO(10, 91, 144, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
