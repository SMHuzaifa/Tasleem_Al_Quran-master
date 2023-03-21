import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';
import 'package:tasleem_al_quran/not_used_files/slide_images.dart';

class ItArtificer extends StatelessWidget {
  static String id = "SaadArshad_id";
  const ItArtificer({Key? key}) : super(key: key);

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
            children:  [
              const PicDate(),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Color.fromRGBO(10, 91, 144, 1),
                  child: CircleAvatar(
                    radius: 97,
                    backgroundImage: AssetImage('assets/ita.png'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  'IT Artificer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromRGBO(10, 91, 144, 1),
                  ),
                ),
              ),
              const Text(
                'Software Company',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(10, 91, 144, 1),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    'Welcome to IT Artificer Software House, a leading provider of software solutions and IT services for businesses and organizations of all sizes. Our team of experienced professionals is dedicated to helping our clients leverage technology to drive growth and success.\n\n'
                    'Our Services:\n\n'
                    'Custom Software Development: Our expert developers can create customized software solutions to meet the unique needs of your business.\n'
                    'Mobile App Development: We specialize in creating innovative and engaging mobile apps for iOS and Android devices.\n\n'
                    'Web Development: Our team can build beautiful and functional websites and web applications that help you reach your target audience and achieve your business goals.\n\n'
                    'Artificial Intelligence and Machine Learning: We are committed to staying at the forefront of emerging technologies, and we can help you leverage AI and ML to improve your business processes and decision-making..\n\n'
                    'Software as a Service (SaaS): Our cloud-based software applications are designed to streamline your business operations and improve efficiency.\n\n'
                    'Cybersecurity: We take cybersecurity seriously, and we offer a range of services to protect your business from cyber threats and attacks.\n\n'
                    'Cloud Computing: Our cloud-based infrastructure and services enable you to store, manage, and process data and applications with ease.\n\n'
                    'Digital Marketing: Our expert marketers can help you develop and execute effective digital marketing strategies, including SEO, PPC advertising, social media marketing, email marketing, and content marketing.\n\n'
                    'Domain and Hosting Services: We provide domain name registration, website hosting, and related services to help you establish and maintain a strong online presence.\n\n'
                    'IT Training and Education: We offer a variety of training programs and courses to help students and professionals develop their IT skills and stay up-to-date on the latest trends and technologies.\n\n'
                    'Our Mission\n\n'
                    'At IT Artificer Software House, our mission is to empower businesses and organizations with the tools and technologies they need to succeed in today rapidly changing digital landscape. We are committed to providing innovative and effective solutions that help our clients achieve their goals and drive growth and success.\n\n'
                    'Contact Us\n',
                    // "If you are interested in learning more about our services, please dont hesitate to contact us. You can reach us by phone at +92-333-9296314, by email at info@itartificer.com, or by visiting our website at Itartificer.com. Our friendly and knowledgeable team is always happy to answer your questions and help you find the solutions that best meet your needs. Thank you for considering IT Artificer Software House for your IT needs\n\n",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 129, 0),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Email:   ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                      TextSpan(text: 'info@itartificer.com',style: TextStyle(color: Colors.black,fontSize: 16)),
                    ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 133, 0),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Phone:   ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                      TextSpan(text: '+92-333-9296314',style: TextStyle(color: Colors.black,fontSize: 16)),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 111, 10),
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Address:  ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                        TextSpan(text: 'KP IT Park, Peshawar',style: TextStyle(color: Colors.black,fontSize: 16)),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
