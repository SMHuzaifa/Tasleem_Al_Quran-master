import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:tasleem_al_quran/quran_files/models/aya_of_the_day.dart';

import 'package:tasleem_al_quran/quran_files/services/api_services.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';
import 'package:tasleem_al_quran/util/routes_name.dart';

import '../admin_files/admin_login_page.dart';
import '../admin_files/user_data.dart';
import '../namaz_timing_file/namaz_loc_check.dart';
import '../qibla_files/compass_file.dart';
import '../bottom_navigation_files/about_us.dart';

class Ayat extends StatefulWidget {
  const Ayat({Key? key}) : super(key: key);

  @override
  _AyatState createState() => _AyatState();
}

class _AyatState extends State<Ayat> {
  final ApiServices _apiServices = ApiServices();
  //
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  final Color active = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        drawer: _buildDrawer(),
        body: Column(
          children: [
            const PicDate(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
                child: Column(
                  children: [
                    FutureBuilder<AyaOfTheDay>(
                      future: _apiServices.getAyaOfTheDay(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Icon(Icons.sync_problem);
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return const CircularProgressIndicator();
                          case ConnectionState.done:
                            return Container(
                              margin: const EdgeInsetsDirectional.all(16),
                              padding: const EdgeInsetsDirectional.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  const Text(
                                    "Quran Aya of the Day",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 0.5,
                                  ),
                                  Text(
                                    snapshot.data!.arText!,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    snapshot.data!.enTran!,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  RichText(
                                    text: TextSpan(children: <InlineSpan>[
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data!.surNumber!
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(snapshot.data!.surEnName!,
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ),
                                      ),
                                    ]),
                                  ),

                                ],
                              ),
                            );
                        }
                      },
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Column(
                    //   children: [
                    //     // const SizedBox(
                    //     //   width: 10,
                    //     // ),
                    //     ElevatedButton(
                    //         style: ElevatedButton.styleFrom(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 30.0, vertical: 20.0),
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(15.0)),
                    //           foregroundColor:
                    //               const Color.fromRGBO(10, 91, 144, 1),
                    //           backgroundColor:
                    //               const Color.fromRGBO(10, 91, 144, 1),
                    //           //onPrimary: Colors.black,
                    //         ),
                    //         onPressed: () {
                    //           PersistentNavBarNavigator
                    //               .pushNewScreenWithRouteSettings(
                    //             context,
                    //             settings: const RouteSettings(
                    //                 name: RoutesName.quranScreen),
                    //             screen: const QuranScreen(),
                    //             withNavBar: true,
                    //             pageTransitionAnimation:
                    //                 PageTransitionAnimation.cupertino,
                    //           );
                    //
                    //           //  Navigator.pushNamed(context, QuranScreen.id);
                    //         },
                    //         child: const Text(
                    //           "Read Online Quran",
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 15),
                    //         )),
                    //     const SizedBox(
                    //       height: 10,
                    //     ),
                    //     ElevatedButton(
                    //         style: ElevatedButton.styleFrom(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 30.0, vertical: 20.0),
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(15.0)),
                    //           foregroundColor:
                    //               const Color.fromRGBO(10, 91, 144, 1),
                    //           backgroundColor:
                    //               const Color.fromRGBO(10, 91, 144, 1),
                    //           //onPrimary: Colors.black,
                    //         ),
                    //         onPressed: () {
                    //           PersistentNavBarNavigator
                    //               .pushNewScreenWithRouteSettings(
                    //             context,
                    //             settings: const RouteSettings(
                    //                 name: RoutesName.qariListScreen),
                    //             screen: const QariListScreen(),
                    //             withNavBar: true,
                    //             pageTransitionAnimation:
                    //                 PageTransitionAnimation.cupertino,
                    //           );
                    //
                    //           // Navigator.pushNamed(context, QariListScreen.id);
                    //         },
                    //         child: const Text(
                    //           "Listen Online Quran",
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 15),
                    //         )),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDrawer() {
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
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Container(
                  //   height: 150,
                  //   width: 150,
                  //   alignment: Alignment.center,
                  //   decoration: const BoxDecoration(
                  //       //shape: BoxShape.circle,
                  //       // gradient: LinearGradient(
                  //       //     colors: [Colors.pink, Colors.deepPurple])
                  //          ),
                  //
                  //   child:  Image(image: AssetImage('assets/tasleemalquranlogo.png'),)
                  //   ),

                  const SizedBox(height: 80.0),
                  _buildRow(Icons.compass_calibration, "Qibla Direction", () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: RoutesName.compass),
                      screen: Compass(),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );

                    //Navigator.pushNamed(context, RoutesName.compass);
                  }),
                  _buildDivider(),
                  _buildRow(Icons.calendar_month, "Ramazan Calendar", () {
                    // Navigator.pushNamed(context, Calendar.id);
                    Fluttertoast.showToast(
                        msg: 'Coming Soon',
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
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                            const RouteSettings(name: RoutesName.namazLocCheck),
                        screen: const NamazLoccheck(),
                        withNavBar: true,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );

                      // Navigator.pushNamed(context, RoutesName.namazLocCheck);
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

                      //Navigator.pushNamed(context, RoutesName.userData);
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

                      //Navigator.pushNamed(context, RoutesName.adminPage);
                    }
                  }, showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.book, "About Us", () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(name: RoutesName.ourTeam),
                      screen: const OurTeam(),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                      //Navigator.pushNamed(context, Quran.id);
                    );
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
