import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/util/slide_images.dart';

class SaadArshad extends StatelessWidget {
  static String id = "SaadArshad_id";
  const SaadArshad({Key? key}) : super(key: key);

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
                    backgroundImage: AssetImage('assets/SaadArshadpic.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  'Saad Arshad',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
                ),
              ),
              Text(
                'Team Manager',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(10, 91, 144, 1),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'A Certified and experienced Team Manager.',
                    style: TextStyle(fontSize: 17),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                  child: Text(
                    'A team manager managing our team and conducting evaluations performance of our teachers.\n\n'
                    'One of the most important role of our manager to providing leadership for the teachers. He oversee and communicator between a parents and our tutors.\n\n'
                    'He monitoring the performance of the team members to ensure objectives are met. And supporting our tutors with training and development activities in the world of technology so the tutor can guide online to the students properly.\n'
                    'We should know a Manager become great communicators by being good listeners.\n\n'
                    'He motivates team members and mediating interpersonal issues.\n\n'
                    'He also providing effective feedback, managing remote teams, utilizing technology, supervising and guiding team members.\n\n'
                    'Our manager managing  all the activities of setting the strategy, about the timings of tutors and students.\n\n'
                    'He also look after  internet or any technological issues and timings of our online sessions.\n\n'
                    'Saad Arshad coordinating the efforts of our employees to fulfill its objectives through the  available resources, such as natural, technological.\n\n'
                    'He set the strategic goals of our organization for our team and make decisions on how the overall organization will operate.\n\n'
                    'Our Team manager tracking the progress of tutors and each child and maintaining a records.\n\n'
                    'He have a clear understanding of the organization’s vision and share it with the people in their team in a way that motivates them.\n\n'
                    'He also keep their team up-to-date on what’s happening in the organization.\n\n',
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
