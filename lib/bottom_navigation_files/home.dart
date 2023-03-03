import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tasleem_al_quran/admin_files/admin_login_page.dart';
import 'package:tasleem_al_quran/admin_files/user_data.dart';
import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc_check.dart';
import 'package:tasleem_al_quran/qibla_files/compass_file.dart';
import 'package:tasleem_al_quran/util/slide_images.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tasleem_al_quran/util/routes_name.dart';

// import '../admin_files/admin_login_page.dart';

import '../not_used_files/bottom_navigation_bar.dart';
import '../util/open_whatsapp.dart';
import 'about_us.dart';
// import '../calendar.dart';
//
// import '../qibla_files/compass_file.dart';
// import '../quran_files/main.dart';

class Home extends StatefulWidget {
  static String id = "Home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  final Color active = Colors.white;
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);

    return WillPopScope(
        onWillPop: () async {
          // Display a confirmation dialog
          bool shouldExit = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirm'),
                content: const Text('Do you want to exit the app?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          );

          if (shouldExit) {
            // Exit from the app
            SystemNavigator.pop();
          }

          return shouldExit;
        },
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget> [
              IconButton(onPressed: (){
                Share.share("https://play.google.com/store/apps/details?id=com.taq.tasleem_al_quran");
              }, icon: Icon(Icons.share))
            ],
            centerTitle: true,
            title: Column(
              children: const [
                Text(
                  'Tasleem Al-Quran Academy',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  '+923075015849',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
            backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
            //automaticallyImplyLeading: false,
          ),
          drawer: _buildDrawer(),
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
              child: Column(children: <Widget>[
                Container(
                  height: _size.height * 0.22, // 22% of screen
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/background_img.jpg'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 40, 40, 6),
                        child: Text(
                          formatted,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(75, 0, 40, 25),
                        child: RichText(
                          text: TextSpan(children: <InlineSpan>[
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  _hijri.hDay.toString(),
                                  style: const TextStyle(
                                      fontSize: 27, color: Colors.white),
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  _hijri.longMonthName,
                                  style: const TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  '${_hijri.hYear} AH',
                                  style: const TextStyle(
                                      fontSize: 27, color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),

                // const SizedBox(
                //   height: 180,
                //   width: 1000,
                //   child: SlideImage(),
                // ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(1, 8, 1, 5),
                  child: Text(
                    'Welcome to TAQ Academy',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(10, 91, 144, 1),
                        fontSize: 19),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 1, 8, 8),
                  child: Text(
                    'Unleash Your Potential with Our Training',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 17),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 1),
                  child: Text(
                    'Learn Online Quran in the best online Quran academy Tasleem Al Quran, at the comfort of your home in a friendly Environment with Us. We enables you how to take a initial step ,where you should take a start with a basic Arabic Alphabets to the words, then Recitation with the Rules of tajweed.\n',
                    // 'We are providing a technology based resources to connect with the Quran and Learn Quran Easily in these modern times.\n'
                    //'In our best online Quran academy offering a teaching services to kids and adults, male and female to All over the world. Our Quran learning courses are specially designed for you and your kids under the guidance of qualified Quran Tutors.\n\n'
                    // 'Tasleem Al Quran welcome to all students interested in step by step Quran Learning with the rules of Tajweed and essential Islamic knowledge, Qur’an Recitation  (Nazra Quran), Basic step of How to read Arabic words that is Noorani Qaida, Memorizing Quran (Hifz ul Quran) Translation and Learn Salat /prayers, important Supplications with the 6 Kalimas.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                  color: Color.fromRGBO(10, 91, 144, 1),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 5, 50, 15),
                  child: Text('Our Services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color.fromRGBO(10, 91, 144, 1),
                      )),
                ),
                Container(
                  width: 350,
                  height: 100,
                  color: const Color.fromRGBO(10, 91, 144, 1),
                  child: const ListTile(
                    title: Text(
                      'Learning Quran',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'As Quran is the prime source of guidance for all the humanity, especially Muslims, therefore, it is the duty of parents to ensure that the kids get proper Quran education',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    width: 350,
                    height: 100,
                    color: const Color.fromRGBO(10, 91, 144, 1),
                    child: const ListTile(
                      title: Text(
                        'Strong Belief',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        'The six Kalimah in Islam is six significant parts of ones religious belief, mostly taken from hadiths (in some traditions, six phrases, then known as the six kalimas.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 350,
                  height: 90,
                  color: const Color.fromRGBO(10, 91, 144, 1),
                  child: const ListTile(
                    title: Text(
                      'Prayer',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'The second rukan of Islam is “Namaz”. Namaz is the act done by Muslims by bowing their heads in the court of Allah.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 350,
                  height: 90,
                  color: const Color.fromRGBO(10, 91, 144, 1),
                  child: const ListTile(
                    title: Text(
                      'Tajweed-e-Qirat',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'Tajweed means to make beauty in reading. It means to pronounce every letter correctly with all its qualities.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 350,
                  height: 90,
                  color: const Color.fromRGBO(10, 91, 144, 1),
                  child: const ListTile(
                    title: Text(
                      'Hifz-ul-Quran',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'Hifz is a memorization of the Quran. Memorizing the Quran helps to improve your memory and understand the creations of Allah Almighty',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 350,
                  height: 90,
                  color: const Color.fromRGBO(10, 91, 144, 1),
                  child: const ListTile(
                    title: Text(
                      'Noorani Qaida',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'A series of books for beginners to learn Quranic Arabic. It is used to teach children how to Learn and read the Quran.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
            ),
          ),
        ));
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
                      screen:  Compass(),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
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
                        settings: const RouteSettings(name: RoutesName.namazLocCheck),
                        screen: const NamazLoccheck(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
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
                        settings: const RouteSettings(name: RoutesName.userData),
                        screen: const UserData(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );




                      //Navigator.pushNamed(context, RoutesName.userData);
                    } else {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(name: RoutesName.adminPage),
                        screen: const AdminPage(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
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
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                     //Navigator.pushNamed(context, Quran.id);
                    );}),
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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Exit!!"),
          content: const Text("You want to Exit?"),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
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
