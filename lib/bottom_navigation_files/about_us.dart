import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:tasleem_al_quran/about_us_files/noreeba_effendi.dart';

import 'package:tasleem_al_quran/about_us_files/iqra_asad.dart';
import 'package:tasleem_al_quran/about_us_files/it_artificer.dart';

import 'package:tasleem_al_quran/about_us_files/saad_arshad.dart';
import 'package:tasleem_al_quran/about_us_files/sabah_malik.dart';
import 'package:tasleem_al_quran/bottom_navigation_files/my_menue.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../about_us_files/ayesha_jadoon.dart';
import '../admin_files/admin_login_page.dart';
import '../admin_files/user_data.dart';

import '../namaz_timing_file/namaz_loc_check.dart';
import '../util/open_whatsapp.dart';

import '../util/routes_name.dart';

class OurTeam extends StatefulWidget {
  static String id = "OurTeam_id";

  const OurTeam({super.key});

  @override
  State<OurTeam> createState() => _OurTeamState();
}

class _OurTeamState extends State<OurTeam> {
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  final Color active = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'TAQ Academy',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
          //automaticallyImplyLeading: false,
        ),
        drawer: buildDrawer(),
        floatingActionButton:
        LargeFloatingActionButton(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const PicDate(),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 65, 0),
                    child: CircleAvatar(
                      radius: 60,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
                        radius: 110,
                        backgroundImage:
                        const AssetImage('assets/ita.png'),
                        child: GestureDetector(
                          onTap: () {

                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: RoutesName.itArtificer),
                              screen: const ItArtificer(),
                              withNavBar: true,
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                            );

                            // Navigator.pushNamed(context, IqraAsad.id);
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
                        const AssetImage('assets/SaadArshadpic.jpg'),
                        child: GestureDetector(
                          onTap: () {
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: RoutesName.saadArshad),
                              screen: const SaadArshad(),
                              withNavBar: true,
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                            );

                            // Navigator.pushNamed(context, AyeshaJadoon.id);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),













              // CircleAvatar(
              //   radius: 100,
              //   backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
              //   child: CircleAvatar(
              //     radius: 97,
              //     backgroundImage: const AssetImage('assets/SaadArshadpic.jpg'),
              //     child: GestureDetector(
              //       onTap: () {
              //         PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              //           context,
              //           settings:
              //               const RouteSettings(name: RoutesName.saadArshad),
              //           screen: const SaadArshad(),
              //           withNavBar: true,
              //           pageTransitionAnimation:
              //               PageTransitionAnimation.cupertino,
              //         );
              //
              //         // Navigator.pushNamed(context, SaadArshad.id);
              //       },
              //     ),
              //   ),
              // ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 2, 0, 0),
                    child: Text(
                      'IT Artificer',
                      style: TextStyle(
                          color: Color.fromRGBO(10, 91, 144, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(100, 2, 0, 0),
                    child: Text(
                      'Saad Arshad',
                      style: TextStyle(
                          color: Color.fromRGBO(10, 91, 144, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
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
                        backgroundImage:
                            const AssetImage('assets/iqrasaad.png'),
                        child: GestureDetector(
                          onTap: () {
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: RoutesName.iqraAsad),
                              screen: const IqraAsad(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );

                            // Navigator.pushNamed(context, IqraAsad.id);
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
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: RoutesName.ayeshaJadoon),
                              screen: const AyeshaJadoon(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );

                            // Navigator.pushNamed(context, AyeshaJadoon.id);
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
                        backgroundImage:
                            const AssetImage('assets/Noreebaeffendi.jpeg'),
                        child: GestureDetector(
                          onTap: () {
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: RoutesName.noreebaEffendi),
                              screen: const NoreebaEffendi(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );

                            //Navigator.pushNamed(context, NoreebaEffendi.id);
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
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: RoutesName.sabahMalik),
                              screen: const SabahMalik(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                            //Navigator.pushNamed(context, SabahMalik.id);
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    child: Image.asset('assets/Tasleem white copy.png'),
                  ),

                  const SizedBox(height: 20.0),
                  _buildRow(FontAwesomeIcons.facebook, "Facebook", () async {
                    final Uri url =
                        Uri.parse("https://www.facebook.com/tasleemalquran/");
                    if (await canLaunchUrl((url))) {
                      await launchUrl((url));
                    } else {
                      throw 'Could not launch try again $url';
                    }
                  }),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.instagram, "Instagram", () async {
                    // Navigator.pushNamed(context, Calendar.id);
                    final Uri url = Uri.parse(
                        "https://www.instagram.com/tasleemalquran/?hl=en");
                    if (await canLaunchUrl((url))) {
                      await launchUrl((url));
                    } else {
                      throw 'Could not launch try again $url';
                    }
                  }),
                  _buildDivider(),
                  _buildRow(
                    FontAwesomeIcons.linkedin,
                    "Linkedin",
                    () async {
                      final Uri url = Uri.parse(
                          "https://pk.linkedin.com/in/tasleemalquran");
                      if (await canLaunchUrl((url))) {
                        await launchUrl((url));
                      } else {
                        throw 'Could not launch try again $url';
                      }
                    },
                    showBadge: true,
                  ),
                  _buildDivider(),
                  _buildRow(Icons.admin_panel_settings, "For Admin", () {
                    if (auth.currentUser != null) {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                            const RouteSettings(name: RoutesName.userData),
                        screen: const UserData(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    } else {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                            const RouteSettings(name: RoutesName.adminPage),
                        screen: const AdminPage(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    }
                  }, showBadge: true),
                  _buildDivider(),
                  // _buildRow(Icons.book, "Quran", () {
                  //   Navigator.pushNamed(context, Quran.id);
                  // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.email, "Contact us", () {
                  // //   print('Tapped contct');
                  // // }),
                  // // _buildDivider(),
                  // // _buildRow(Icons.info_outline, "Help", () {
                  // //   print('Tapped help');
                  // }),
                  const SizedBox(
                    height: 300,
                  ),
                  const Text(
                    "Powered By IT Artificer",
                    style: TextStyle(color: Colors.white),
                  )
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
    final TextStyle tStyle = TextStyle(color: Colors.white, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: Colors.white,
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
