import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/slide_images.dart';

class SabahMalik extends StatelessWidget {
  static String id = "SabahMalik_id";
  const SabahMalik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text(
          'Tasleem Al-Quran Academy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
        //automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 180,
                width: 360,
                child: SlideImage(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Color.fromRGBO(10, 91, 144, 1),
                  child: CircleAvatar(
                    radius: 97,
                    backgroundImage: AssetImage('assets/sabahmalik.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  'Sabah Malik',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
                ),
              ),
              Text(
                'Quran Tutor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(10, 91, 144, 1),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                  child: Text(
                    'A very Experienced and Qualified tutor so learn online Quran from best tutor Hafiz Al-Qur’an from Wafaq.ul.Madaris Al Arabia Pakistan and also qualified in Tajweed. Also qualified Quran translation both in Urdu and English languages. She is certified in Qirat and having a eight year experience of online tutoring Quran. Our online Quran tutor teaching a students to read Quran online with proper rules of Tajweed. She also helping a students in any difficulty of learning Quran Online.\n\n'
                    ' Our this tutor have a ability to encourage their students and inspire them to love and learn Quran online. She have a excellent teamwork and communication skills and making strong relationship with a students. Quran is a complete code of life. Quran gives the knowledge about all aspects of life which brings near to Allah. So for this reason we offer an expert teacher services as well as one to one Skype session at your door step. Online teaching is not an easy task and it needs more patience. She is a confident tutor Along with patience, and a command over the teaching online Quran.\n\n'
                    'There are many ways to memorize Quran, it depends on student caliber. She look first at the students ability and implementing the educational strategies according to students learning capacity. After that implement her strategy on a students to memorizing the Quran. Our Quran academy is a virtual organization that brings teachers and students learning session interesting through Islamic activities.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
