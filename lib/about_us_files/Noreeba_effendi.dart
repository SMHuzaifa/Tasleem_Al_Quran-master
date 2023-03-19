import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';
import 'package:tasleem_al_quran/not_used_files/slide_images.dart';

class NoreebaEffendi extends StatelessWidget {
  static String id = "NoreebaEffendi_id";
  const NoreebaEffendi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text(
          'TAQ Academy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
        //automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
             PicDate(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Color.fromRGBO(10, 91, 144, 1),
                  child: CircleAvatar(
                    radius: 97,
                    backgroundImage: AssetImage('assets/Noreebaeffendi.jpeg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  'Noreeba Effendi',
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
                    'A Certified and Experienced tajweed Quran teacher with a Qualification of Basic and Advance Tajweed ul Quran.\n\n'
                    'Tasleem al Quran Academy offering a Tajweed ul Quran Course and providing a tajweed tutor. She is having a six year experience of teaching Tajweed Quran.\n\n'
                    'Why the learning of Quran with Tajweed is Important?'
                    'Tajweed learning is a chance to gain a countless number of good deeds. As we know there are many benefits of learning Quran with tajweed. After that Students can pronounce Arabic words correctly and easily.\n\n'
                    'Do you thinking How to learn Quran with tajweed?'
                    'Here in a Tasleem Al Quran Online Academy. Our Tajweed teacher teaching For Intermediate and Advance level students.\n\n'
                    'Our Tajweed tutor explaining the easiest way to learn tajweed with practical activity. She is teaching a Quran with  Tajweed From O level to Advance level. After that Students will be able to read Quran with a proper rules of tajweed without any help.\n\n'
                    'As we know Tajweed is all about phonetics and linguistics.  It helps to improving students pronunciation abilities. There is a great importance of learning Quran with tajweed Rules. It provide a completely different meaning of word and how to pronouncing a word.\n\n'
                    'The Quality of her that she attract the students towards learning Quran by telling them to different stories of Islam. She is teaching Tajweed by practical activity. She have ability to deliver the information according to each student’s learning style, i.e informative and fun experiences.\n\n'
                    'Tajweed rules defines the all grammatical rules of every Arabic words. So here in our best online academy offering the tajweed Quran classes. Our experience teacher guide you the tajweed of Quran in your language.\n\n'
                    'After taking our Online Quran classes you and your children’s become a best tajweed Quran reciter. IN-SHA-ALLAH\n\n',
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
