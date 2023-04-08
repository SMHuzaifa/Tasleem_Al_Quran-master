import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tasleem_al_quran/hadees_of_the_day.dart';
import 'package:tasleem_al_quran/islamic_date_in_history.dart';

import 'package:tasleem_al_quran/quran_files/screens/qari_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/quran_screen.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';
import 'package:tasleem_al_quran/zakat.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

import '../admin_files/admin_login_page.dart';
import '../admin_files/user_data.dart';

import '../islamic_calendar.dart';
import 'home.dart';
import '../quran_files/ayat_of_the_day.dart';
import '../namaz_timing_file/namaz_loc_check.dart';
import '../qibla_files/compass_file.dart';
import '../util/open_whatsapp.dart';
import '../util/routes_name.dart';

class MyMenue extends StatefulWidget {
  static String id = "MyMenue_id";

  const MyMenue({super.key});

  @override
  State<MyMenue> createState() => _MyMenueState();
}

class _MyMenueState extends State<MyMenue> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    // onPrimary: Colors.black87,
    primary: const Color.fromRGBO(10, 91, 144, 1),
    // primary: Colors.grey[300],
    maximumSize: const Size(88, 75),
    elevation: 15,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  );

  final Color active = const Color(0xBAFFFFFF);
  //
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                tooltip: "Share App",
                onPressed: () {
                  Share.share(
                      "https://play.google.com/store/apps/details?id=com.taq.tasleem_al_quran");
                },
                icon: const Icon(Icons.share))
          ],
          centerTitle: true,
          title: Column(
            children: const [
              Text(
                'Tasleem Al-Quran Academy',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
          //automaticallyImplyLeading: false,
        ),
        drawer: buildDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          tooltip: 'Contact Us',
          child: const Icon(FontAwesomeIcons.whatsapp,size: 46,),
          onPressed: () {
            openWhatsapp();
          },
        ),

        body: UpgradeAlert(
          upgrader: Upgrader(shouldPopScope: () => true,
          canDismissDialog: true,
          durationUntilAlertAgain: const Duration(days:1),
          dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material,
           ),

          child: SingleChildScrollView(

            child: Column(
              children: <Widget>[
                const PicDate(),

                Container(
                  margin: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 80.0),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(10, 91, 144, 0.4),
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings:
                                    const RouteSettings(name: RoutesName.home),
                                screen: const Home(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'TAQ Academy',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Icon(FlutterIslamicIcons.mosque,size: 40,)
                                // Image.asset(
                                //   height: 45,
                                //   'assets/home.png',
                                //   color: Colors.white,
                                // )
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: RoutesName.quranScreen),
                                screen: const QuranScreen(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Read Quran',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Icon(FlutterIslamicIcons.quran,size: 45,)
                                // Image.asset(
                                //   height: 45,
                                //   'assets/holyQuran.png',
                                //   color: Colors.white,
                                // )
                              ],
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: RoutesName.qariListScreen),
                                screen: const QariListScreen(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Listen Quran',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Image.asset(
                                  height: 45,
                                  'assets/holyQuran.png',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings:
                                    const RouteSettings(name: RoutesName.compass),
                                screen: Compass(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Qibla Direction',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Icon(FlutterIslamicIcons.qibla,size: 45,)
                                // Image.asset(
                                //   height: 45,
                                //   'assets/qibla_icon.png',
                                //   color: Colors.white,
                                // ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: RoutesName.namazLocCheck),
                                screen: const NamazLoccheck(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Prayer Times',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Icon(FlutterIslamicIcons.prayingPerson,size: 45,)
                                // Image.asset(
                                //   height: 45,
                                //   'assets/mosque.png',
                                //   color: Colors.white,
                                // ),
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: RoutesName.calendar),
                                screen: const CalenderPage(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                              );




                              // Fluttertoast.showToast(
                              //     msg: 'Coming Soon',
                              //     toastLength: Toast.LENGTH_SHORT,
                              //     gravity: ToastGravity.CENTER,
                              //     timeInSecForIosWeb: 1,
                              //     backgroundColor: Colors.red,
                              //     textColor: Colors.white,
                              //     fontSize: 16);

                            },
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Islamic Calendar',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Image.asset(
                                  height: 45,
                                  'assets/calendar.png',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings:
                                    const RouteSettings(name: RoutesName.ayat),
                                screen: const Ayat(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Ayat of the Day',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 0.1,
                                ),
                                Icon(FlutterIslamicIcons.quran2,size: 40,)
                                // Image.asset(
                                //   height: 45,
                                //   'assets/ayat.png',
                                //   color: Colors.white,
                                // ),
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings:
                                const RouteSettings(name: RoutesName.zakat),
                                screen:  const ZakatApp(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Calculate Zakat',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 0.1,
                                ),
                                Icon(FlutterIslamicIcons.zakat,size: 42,)
                              ],
                            ),
                          )),
                        ],
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  PersistentNavBarNavigator
                                      .pushNewScreenWithRouteSettings(
                                    context,
                                    settings:
                                    const RouteSettings(name: RoutesName.ayat),
                                    screen: const HadeesOfTheDay(),
                                    withNavBar: true,
                                    pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Column(
                                  children:  <Widget>[
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Hadith of the Day',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 0.1,
                                    ),
                                    Image.asset('assets/hadees.png',height: 40,color: Colors.white,)
                                    // Image.asset(
                                    //   height: 45,
                                    //   'assets/ayat.png',
                                    //   color: Colors.white,
                                    // ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  PersistentNavBarNavigator
                                      .pushNewScreenWithRouteSettings(
                                    context,
                                    settings:
                                    const RouteSettings(name: RoutesName.zakat),
                                    screen:  const IslamicDateInHistory(),
                                    withNavBar: true,
                                    pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Islamic History',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 0.1,
                                    ),
                                    Image.asset('assets/calender.png',height: 40,color: Colors.white,)
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
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
                  const SizedBox(
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
    const TextStyle tStyle = TextStyle(color: Colors.white, fontSize: 16.0);
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
