import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc.dart';
import 'package:tasleem_al_quran/namaz_timing_file/namaz_loc_check.dart';
import 'package:tasleem_al_quran/slide_images.dart';

import '../admin_files/admin_login_page.dart';

import '../bottom_navigation_bar.dart';
import '../calendar.dart';

import '../compass/location.dart';


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
    return Scaffold(
      appBar: AppBar(
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
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 180,
                width: 1000,
                child: SlideImage(),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(1, 8, 1, 5),
                child: Expanded(
                    child: Text(
                  'Welcome to Tasleem Al-Quran Academy!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(10, 91, 144, 1),
                      fontSize: 19),
                )),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 1, 8, 8),
                child: Text(
                  'Learn Qur’an Online with us and Spread the Knowledge of Qur’an.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 19),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 8, 8),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 15),
                child: Text('Our Services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color.fromRGBO(10, 91, 144, 1),
                    )),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/learningQuranIcon.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Learning Quran',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Text(
                              'As Quran is the prime source of guidance for all the humanity, especially Muslims, therefore, it is the duty of parents to ensure that the kids get proper Quran education',
                              textAlign: TextAlign.justify,
                            ))
                      ],
                    )
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/strongbeliefIcon.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Strong Belief',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          'The six Kalimah in Islam is six significant parts of ones religious belief, mostly taken from hadiths (in some traditions, six phrases, then known as the six kalimas.',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/prayer.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Prayer',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 2, 30, 10),
                        child: Text(
                          'The second rukan of Islam is “Namaz”. Namaz is the act done by Muslims by bowing their heads in the court of Allah.',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/tajweedIcon.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Tajweed-e-Qirat',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 2, 30, 10),
                        child: Text(
                          'Tajweed means to make beauty in reading. It means to pronounce every letter correctly with all its qualities.',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/hifzIcon.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Hifz-ul-Quran',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          'Hifz is a memorization of the Quran. Memorizing the Quran helps to improve your memory and understand the creations of Allah Almighty',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/nooraniIcon.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Noorani Qaida',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          'A series of books for beginners to learn Quranic Arabic. It is used to teach children how to Learn and read the Quran.',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/prayer.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Salah',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 1, 30, 10),
                        child: Text(
                          '“O you who have believed, seek help through patience and prayer. Indeed, Allah is with the patient.” (Q 2:153)',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/fasting.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Fasting',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          '"Fasting is prescribed for you as it was prescribed for those before you, that you may attain taqwaa." (Q 2:183)',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/zakah.png',
                            // alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Zakah',
                          // textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          '“And keep the prayer established, and pay the zakah, and bow your heads with those who bow down.” (Q 2:43)',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Image.asset(
                            width: 85,
                            'assets/hajj.png',
                            alignment: Alignment.center,
                          ),
                        ),
                        const Text(
                          'Hajj',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(10, 91, 144, 1)),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          '"Then let them end their untidiness and fulfill their vows and perform Tawaf around the ancient House." (Q 22:29)',
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),

              // Stack(
              //   children: [
              //     Image.asset('assets/quranpic.png'),
              //
              //      const Padding(
              //        padding: EdgeInsets.fromLTRB(5,10,10,10),
              //        child: Text('LIVE LIFE THROUGH QURAN',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.white ),),
              //      ),
              //     const Padding(
              //       padding: EdgeInsets.fromLTRB(5,50,10,10),
              //       child: Text('Qur’an can be a motivation for anyone (Children, youngsters & Adults)The word ALLAH Subhanahu Wa Ta’ala revealed to the PROPHET ﷺ through the Angel Jibril. Prophet MUHAMMAD ﷺ also followed Qur’an & asked his Disciples to do in this life & afterlife to succeed. Tasleem-Al-Qur’an online institute would be a best choice to involve Qur’an in our life to live peacefully, happily attain success.',textAlign:TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color:Colors.white ),),
              //     ),
              //   ],
              // ),

              //   Text('WE HAVE A MISSION',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Color.fromRGBO(10, 91, 144, 1),))
              // ),
              // const Padding(padding: EdgeInsets.all(7),
              //   child:
              //   Text('As compared to other online Quran Institute, Our best online Quran academy provides effective classes and Tajweed( Reading of the Holy Quran with correct pronunciation and accent ) classes at affordable charges to let most of the Muslims can learn Quran at home online.',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color:Colors.black54,))
            ],
          ),
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
                  const SizedBox(height: 80.0),
                  _buildRow(Icons.compass_calibration, "Qibla Direction", () {
                    Navigator.pushNamed(context, Location.id);
                  }),
                  _buildDivider(),
                  _buildRow(Icons.calendar_month, "Ramazan Calendar", () {
                    Navigator.pushNamed(context, Calendar.id);
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
                      Navigator.pushNamed(context, AdminPage.id);

                  }, showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings", () {
                    print('Tapped setting');
                  }),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us", () {
                    print('Tapped contct');
                  }),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Help", () {
                    print('Tapped help');
                  }),
                  _buildDivider(),
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
