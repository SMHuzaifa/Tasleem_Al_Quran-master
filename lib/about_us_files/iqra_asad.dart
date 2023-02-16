import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/slide_images.dart';

class IqraAsad extends StatelessWidget {
  static String id = "IqraSaad_id";
  const IqraAsad({Key? key}) : super(key: key);

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
                    backgroundImage: AssetImage('assets/iqrasaad.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  'Iqra Asad',
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
                    'Hifz Al-Quran and Tajweed course from Wafaq-ul-Madaris Al Arabia. IQRA ASAD is having a five year Experience of teaching Quran to all level of students.\n\n'
                    'She have a command on teaching a Quran Recitation with a rules of Tajweed.\n\n'
                    'A very Polite in nature and a command on her teaching skill. IQRA ASAD is having a good communication skills so children feel easy and comfortable. Due to her nature of teaching students will be able to learn Quran and understand better.\n\n'
                    'Our Quran Teachers are very hardworking individuals of high caliber and self motivated. She also having a motivating power to motivate their students for learning Quran.\n\n'
                    'She helps a students to learn Arabic  letters,words,sentence with a rules of tajweed. Our tutor focusing on pronounciation and point of delivering a lessons step by step with a very simple and easyway.\n\n'
                    'In our best online Quran academy offering a teaching services to kids and adults, female to All over the world. Our Quran learning courses are specially designed for you and your kids under the guidance of qualified Quran Tutors.\n\n'
                    'Tasleem Al Quran welcome to all students interested in step by step Quran Learning with the rules of Tajweed and essential Islamic knowledge, Qur’an Recitation  (Nazra Quran), Basic step of How to read Arabic words that is Noorani Qaida, Memorizing Quran (Hifz ul Quran) Translation and Learn Salat /prayers, important Supplications with the 6 Kalimas.\n\n',
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
