import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasleem_al_quran/bottom_navigation_bar.dart';

import 'package:tasleem_al_quran/about_us_files/Noreeba_effendi.dart';

import 'package:tasleem_al_quran/about_us_files/iqra_asad.dart';

import 'package:tasleem_al_quran/about_us_files/saad_arshad.dart';
import 'package:tasleem_al_quran/about_us_files/sabah_malik.dart';
import 'package:tasleem_al_quran/quran_files/main.dart';
import 'package:tasleem_al_quran/slide_images.dart';

import '../about_us_files/ayesha_jadoon.dart';
import '../admin_files/admin_login_page.dart';
import '../admin_files/user_data.dart';
import '../namaz_timing_file/namaz_loc_check.dart';
import '../qibla_files/compass_file.dart';
import 'home.dart';

class OurTeam extends StatefulWidget {
  static String id = "OurTeam_id";

  const OurTeam({super.key});

  @override
  State<OurTeam> createState() => _OurTeamState();
}

class _OurTeamState extends State<OurTeam> {
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  final Color active = Colors.white;

  // @override
  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(myInterceptor);
  // }
  //
  // @override
  // void dispose() {
  //   BackButtonInterceptor.remove(myInterceptor);
  //   super.dispose();
  // }
  //
  // // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  // //   Navigator.pop(context);
  // //   Navigator.pushNamed(context, MyNavigationBar.id); // Do some stuff.
  // //   return true;
  // // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {

      if (Navigator.of(context).canPop()) {

        Navigator.of(context).pop();
        return false;
      } else {
        return true;
      }
    },

      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tasleem Al-Quran Academy',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
          //automaticallyImplyLeading: false,
        ),
        drawer: buildDrawer(),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 65, 0),
                      child: CircleAvatar(
                        radius: 60,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: CircleAvatar(
                        radius: 60,
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
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 2, 97, 0),
                      child: Text(
                        'Iqra Asad',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Ayesha Jadoon',
                      style: TextStyle(
                          color: Color.fromRGBO(10, 91, 144, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 65, 0),
                      child: CircleAvatar(
                        radius: 60,
                        child: CircleAvatar(
                          backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                          radius: 97,
                          backgroundImage: const AssetImage('assets/Noreebaeffendi.jpeg'),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, NoreebaEffendi.id);
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: CircleAvatar(
                        radius: 60,
                        child: CircleAvatar(
                          backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                          radius: 97,
                          backgroundImage:
                          const AssetImage('assets/sabahmalik.jpg'),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SabahMalik.id);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 2, 75, 0),
                      child: Text(
                        'Noreeba Effendi',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Saba Malik',
                      style: TextStyle(
                          color: Color.fromRGBO(10, 91, 144, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  buildDrawer() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary,
              boxShadow: const [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 80.0),
                  _buildRow(Icons.compass_calibration, "Qibla Direction", () {
                    Navigator.pushNamed(context, Compass.id);
                  }),
                  _buildDivider(),
                  _buildRow(Icons.calendar_month, "Ramazan Calendar", () {
                    // Navigator.pushNamed(context, Calendar.id);
                    Fluttertoast.showToast(
                        msg:'Coming Soon',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16);
                  }),
                  _buildDivider(),
                  _buildRow(
                    Icons.access_time_filled,
                    "Namaz Timing",
                        () {
                      Navigator.pushNamed(context, NamazLoccheck.id);
                    },
                    showBadge: true,
                  ),
                  _buildDivider(),
                  _buildRow(Icons.admin_panel_settings, "For Admin", () {
                    if (auth.currentUser != null) {
                      Navigator.pushNamed(context, UserData.id);
                    } else {
                      Navigator.pushNamed(context, AdminPage.id);
                    }

                  }, showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.book, "Quran", () {
                    Navigator.pushNamed(context, Quran.id);
                  }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.email, "Contact us", () {
                  // //   print('Tapped contct');
                  // // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.info_outline, "Help", () {
                  // //   print('Tapped help');
                  // }),
                  const SizedBox(
                    height: 350,
                  ),
                  const Text("Powered By IT Artificer",style: TextStyle(color: Colors.white),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(IconData icon, String title, onTap,
      {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: tStyle,
          ),
        ),
        //const Spacer(),
      ]),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}








