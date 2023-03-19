import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasleem_al_quran/not_used_files/slide_images.dart';

import '../util/open_whatsapp.dart';
import 'bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  static String id = "Home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        tooltip: 'Contact Us',
        child: Icon(FontAwesomeIcons.whatsapp,size: 46,),
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
                  ),],
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    'As Quran is the prime source of guidance for all the humanity, especially Muslims, therefore, it is the duty of parents to ensure that the kids get proper Quran education',
                    textAlign: TextAlign.justify,
                  )),


              Image.asset(
                width: 85,
                'assets/strongbeliefIcon.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Strong Belief',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    'The six Kalimah in Islam is six significant parts of ones religious belief, mostly taken from hadiths (in some traditions, six phrases, then known as the six kalimas.',
                  )),

              Image.asset(
                width: 85,
                'assets/prayer.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Prayer',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    'The second rukan of Islam is “Namaz”. Namaz is the act done by Muslims by bowing their heads in the court of Allah.',
                  )),

              Image.asset(
                width: 85,
                'assets/tajweedIcon.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Tajweed-e-Qirat',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    'Tajweed means to make beauty in reading. It means to pronounce every letter correctly with all its qualities.',
                  )),

              Image.asset(
                width: 85,
                'assets/hifzIcon.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Hifz-ul-Quran',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    'Hifz is a memorization of the Quran. Memorizing the Quran helps to improve your memory and understand the creations of Allah Almighty',
                  )),

              Image.asset(
                width: 85,
                'assets/nooraniIcon.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Noorani Qaida',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    'A series of books for beginners to learn Quranic Arabic. It is used to teach children how to Learn and read the Quran.',
                  )),

              Image.asset(
                width: 85,
                'assets/prayer.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Salah',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    '“O you who have believed, seek help through patience and prayer. Indeed, Allah is with the patient.” (Q 2:153)',
                  )),

              Image.asset(
                width: 85,
                'assets/fasting.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Fasting',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    '"Fasting is prescribed for you as it was prescribed for those before you, that you may attain taqwaa." (Q 2:183)',
                  )),

              Image.asset(
                width: 85,
                'assets/zakah.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Zakah',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    '“And keep the prayer established, and pay the zakah, and bow your heads with those who bow down.” (Q 2:43)',
                  )),

              Image.asset(
                width: 85,
                'assets/hajj.png',
                alignment: Alignment.center,
              ),
              const Text(
                'Hajj',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(10, 91, 144, 1)),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    '"Then let them end their untidiness and fulfill their vows and perform Tawaf around the ancient House." (Q 22:29)',
                  )),
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
}
