import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/dashboard_files/about_us.dart';
import 'package:tasleem_al_quran/slide_images.dart';

import '../bottom_navigation_bar.dart';

class Courses extends StatefulWidget {
  static String id = "Courses_id";
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
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
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'Highlight Quran Courses',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(10, 91, 144, 1),
                        fontWeight: FontWeight.bold),
                  )),
              const Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    '● Tasleem Al Quran key work consists of\n   Best Quran Teaching Courses online with\n   modern and spirited ways.\n\n'
                    '● The best methods and procedures are\n    using to teach Online Quran.\n\n'
                    '● We offer the processes in these  Quran\n   teaching courses that help the students\n   to learn and grow in learning.\n\n'
                    '● After learning these courses students can\n   maintain itself by independent effort in\n   reading Qur’an in future إن شاء الله \n\n'
                    '● Learn the Holy Qur’an online with a proper\n   Tajweed courses.\n\n'
                    '● Read and understand the concepts of\n   Quran with us.\n\n'
                    '● Learn Quran with Urdu Translation.\n\n'
                    '● Also learn Quran with Tafseer.\n\n'
                    '● Learn how to recite and memorize Quran\n   in online classes.\n\n'
                    '● Our Quran Lessons for kids, adults and\n   females with live tutors over Skype and\n   zoom. \n\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                child: Text(
                  'We also offer Free Trial Seminar for 3 days.\n\n'
                  'So what’re you waiting for,  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(1, 20, 180, 0),
                child: Text(

                  'GET a FREE TRAIL',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green),
                ),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                  child: Row(
                    children: [
                      Image.asset('assets/learningQuranIcon.png'),
                      const Text(
                        'Learn Noorani Qaida',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),

                ),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                  child: Row(
                    children: [
                      Image.asset('assets/prayer.png'),
                      const Text(
                        'Learn Rules of Tajweed',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                  child: Row(
                    children: [
                      Image.asset('assets/strongbeliefIcon.png'),
                      const Text(
                        'Qur’an For Beginners',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                  child: Row(
                    children: [
                      Image.asset('assets/learningQuranIcon.png'),
                      const Text(
                        'Learn Hifz-ul-Quran Online',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                  child: Row(
                    children: [
                      Image.asset('assets/tajweedIcon.png'),
                      const Text(
                        'Learn Online Translation of Quran',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                  child: Row(
                    children: [
                      Image.asset('assets/prayer.png'),
                      const Text(
                        'Pillars of Islam & Belief System',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white60,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                  child: Row(
                    children: [
                      Image.asset('assets/strongbeliefIcon.png'),
                      const Text(
                        'Daily Islamic Supplications',
                        style: TextStyle(
                            color: Color.fromRGBO(10, 91, 144, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
