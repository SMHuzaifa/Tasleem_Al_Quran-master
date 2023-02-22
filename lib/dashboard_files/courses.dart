import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasleem_al_quran/dashboard_files/about_us.dart';
import 'package:tasleem_al_quran/slide_images.dart';

import '../admin_files/admin_login_page.dart';
import '../admin_files/user_data.dart';
import '../bottom_navigation_bar.dart';
import '../namaz_timing_file/namaz_loc_check.dart';
import '../qibla_files/compass_file.dart';

class Courses extends StatefulWidget {
  static String id = "Courses_id";
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final Color primary = const Color.fromRGBO(10, 91, 144, 1);

  final Color active = Colors.white;


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
                  padding: EdgeInsets.fromLTRB(0, 15, 20, 10),
                  child: Text(
                    'Highlight Quran Courses',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(10, 91, 144, 1),
                        fontWeight: FontWeight.bold),
                  )),
              const Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
                  child: Text(
                    'Tasleem Al Quran key work consists of Best Quran Teaching Courses online with modern and spirited ways.\n\n'
                    'The best methods and procedures are using to teach Online Quran.\n\n'
                    'We offer the processes in these  Quran teaching courses that help the students to learn and grow in learning.\n\n'
                    'After learning these courses students can maintain itself by independent effort in reading Qur’an in future إن شاء الله \n\n'
                    'Learn the Holy Qur’an online with a proper Tajweed courses.\n\n'
                    'Read and understand the concepts of Quran with us.\n\n'
                    'Learn Quran with Urdu Translation.\n\n'
                    'Also learn Quran with Tafseer.\n\n'
                    'Learn how to recite and memorize Quran in online classes.\n\n'
                    'Our Quran Lessons for kids, adults and females with live tutors over Skype and zoom. \n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17,height: 1,),
                  )),

              const Padding(
                padding: EdgeInsets.fromLTRB(1, 0, 180, 0),
                child: Text(
                  'GET a FREE TRAIL',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                     height: 80,
                      width: 150,
                      child: Card(
                        color: const Color.fromRGBO(10, 91, 144, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 2,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18, 15, 0, 0),
                          child: Text(
                            ' Learn\n Noorani Qaida',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),

                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
             height: 80,
                      width: 150,
                      child: Card(
                        color: const Color.fromRGBO(10, 91, 144, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 2,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18, 15, 0, 0),
                          child: Text(
                            ' Learn Rules\n of Tajweed',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      width: 150,
                      child: Card(
                        color: const Color.fromRGBO(10, 91, 144, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 2.0,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18, 15, 0, 0),
                          child: Text(
                            ' Qur’an\n For Beginners',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),

                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      width: 150,
                      child: Card(
                        color: const Color.fromRGBO(10, 91, 144, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 2.0,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                          child: Text(
                            ' Learn\n Hifz-ul-Quran\n Online',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      width: 150,
                      child: Card(
                        color: const Color.fromRGBO(10, 91, 144, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 2.0,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                          child: Text(
                            ' Learn Online\n Translation of\n Quran',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      width: 150,
                      child: Card(

                        color: const Color.fromRGBO(10, 91, 144, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: 2.0,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                          child: Text(
                            ' Pillars of\n Islam & Belief\n System',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
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
                  // // _buildRow(Icons.settings, "Settings", () {
                  // //   print('Tapped setting');
                  // // }),
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


