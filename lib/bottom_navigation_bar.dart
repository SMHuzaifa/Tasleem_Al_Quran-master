// // //
// // //
// // //
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:tasleem_al_quran/about_us.dart';
// // // import 'package:tasleem_al_quran/pag3.dart';
// // //
// // // import 'home.dart';
// // // import 'my_menue.dart';
// // //
// // // class MyNavigationBar extends StatelessWidget {
// // //   const MyNavigationBar({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: CupertinoTabScaffold(tabBar: CupertinoTabBar(
// // //         activeColor: Colors.red,
// // //           inactiveColor: const Color.fromRGBO(10, 91, 144, 1),
// // //
// // //           items: const <BottomNavigationBarItem>[
// // //             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
// // //             BottomNavigationBarItem(
// // //                 icon: Icon(Icons.person_outline_rounded), label: "About Us"),
// // //             BottomNavigationBarItem(
// // //                 icon: Icon(Icons.play_lesson), label: "Courses"),
// // //             BottomNavigationBarItem(
// // //                 icon: Icon(Icons.payments), label: "Fee Chart"),
// // //             BottomNavigationBarItem(
// // //                 icon: Icon(Icons.app_registration), label: "Register"),
// // //           ]
// // //       ),
// // //         tabBuilder: (context, index) {
// // //           switch (index) {
// // //             case 0:
// // //               return CupertinoTabView(builder: (context) {
// // //                 return  CupertinoPageScaffold(child: MyMenu(),);
// // //               });
// // //             case 1:
// // //               return CupertinoTabView(builder: (context) {
// // //                 return    const CupertinoPageScaffold(child: HomePage(),);
// // //               });
// // //             case 2:
// // //               return CupertinoTabView(builder: (context) {
// // //                 return   CupertinoPageScaffold(child: Page2(),);
// // //               });
// // //             case 3:
// // //               return CupertinoTabView(builder: (context) {
// // //                 return   const CupertinoPageScaffold(child: Page3());
// // //               });
// // //             case 4:
// // //               return CupertinoTabView(builder: (context) {
// // //                 return   const CupertinoPageScaffold(child: Page3());
// // //               });
// // //               default: return CupertinoTabView(builder: (context){
// // //                 return CupertinoPageScaffold(child: MyMenu(),);
// // //           });
// // //         }
// // //
// // //
// // // }),
// // //     );
// // // }}
// //
// //
// //
// //
// //
// //
// //
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasleem_al_quran/dashboard_files/courses.dart';
import 'package:tasleem_al_quran/dashboard_files/fee_chart.dart';

import 'package:tasleem_al_quran/dashboard_files/home.dart';
import 'package:tasleem_al_quran/dashboard_files/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

import 'admin_files/user_data.dart';
import 'dashboard_files/Register.dart';

class MyNavigationBar extends StatefulWidget {
  static String id = "MyNavigationBar_id";
  const MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  bool err = false;
  String msgErr = '';
  int _currentIndex = 0;

// all pages
  final List<Widget> _children = [
    //MyMenue(),
    const Home(),
    const OurTeam(),
    const Courses(),
    const Fee(),
    const Register()
  ];

  void OnTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor:Color.fromRGBO(10, 91, 144, 0.4),
        // selectedIconTheme:
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,

        unselectedItemColor: const Color.fromRGBO(10, 91, 144, 1),
        onTap: OnTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: "About Us"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_lesson), label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.payments), label: "Fee Chart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: "Register"),
        ],
      ),
    );
  }
}


openWhatsapp() async {
  final Uri phoneNumber = Uri.parse("+923075015849");
  final Uri _urlandroid =
      Uri.parse("whatsapp://send?phone=$phoneNumber&text=hello");
  final Uri _urlios =
      Uri.parse("https://wa.me/$phoneNumber?text=${(Uri.parse("hello"))}");


  if (Platform.isIOS) {
    if (await canLaunchUrl(_urlios)) {
      await launchUrl(_urlios);
    } else {
      Fluttertoast.showToast(
          msg: "No WhatsApp Installed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } else {
    if (Platform.isAndroid) {
      if (await canLaunchUrl(_urlandroid)) {
        await launchUrl(_urlandroid);
      } else {
        Fluttertoast.showToast(
            msg: "No WhatsApp Installed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
