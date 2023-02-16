import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/slide_images.dart';

class AyeshaJadoon extends StatelessWidget {
  static String id = "AyeshaJadoon_id";
  const AyeshaJadoon({Key? key}) : super(key: key);

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
                    backgroundImage: AssetImage('assets/ayeshajadoon.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  'Ayesha Jadoon',
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
                    'A Certified and experienced Online Quran translation teacher who Works 1-on-1.\n\n'
                    'Tasleem Al Quran a Best online Quran academy providing you a Quran Translation Teacher.\n\n'
                    'A Native English speaker who will encourage you always to improve your Quran learning skills.\n\n'
                    'Our Quran translation teacher can teach you a Online Quran Pak Translation by words and by verse.\n\n'
                    'Learn Translation and Tafseer of Quran Pak  by our qualified teacher in a friendly environment.\n\n'
                    'Understand a Quran in your own language.\n\n'
                    'Our Quran translation teacher have strong skills over the languages. They can speak and command over English, Urdu, and Arabic.\n\n'
                    'She has good communication skills to motivate and encourage students. Our tutor makes learning environment for students then they can easily understand the Quran kareem.\n\n'
                    'The words of the Quran are very precise so when we recite the Holy Quran with the translation, it makes everything easy to understand and comprehend.\n\n'
                    'So our tutor helps you to understand the meaning and knowledge of the Quran especially for Non-Arabic people’s.\n\n'
                    'Islam is a complete code of life and it is based on Quran kareem that control the rules of law. Quran tell us how to live a life, justice, behavior with parents and much more.\n\n'
                    'Quran gives us a motivation when we fall down so it is very important to understand about Quran.\n\n'
                    'We know Allah Almighty revealed a Quran to our last holy prophet and his beloved messenger Muhammad (PBUH) in Arabic language.\n\n'
                    'As we know it is a difficulty for our Non Arabs, Muslim brothers and sisters to understand the meaning of Quran. So the learning Quran translation is important as learning Quran in Arabic itself.\n\n'
                    'For this purpose our Best online Quran academy provides you a highly qualified tutor who have a seven year experience and a very punctual and friendly.\n\n'
                    'She makes learning Quran easy for you by some Islamic stories and Activities.\n\n'
                    'If you want to see our online Quran learning classes then you can see our Instagram and follow us for the latest updates.\n\n'
                    'May Allah guide us for chosen a right path and understand the concept of Quran kareem. Ameen Ya rabb ul Aalamin.',
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
