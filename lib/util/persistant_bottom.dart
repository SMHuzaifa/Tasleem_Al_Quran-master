// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tasleem_al_quran/quran_files/quran_button.dart';
//
// import 'dashboard_files/Register.dart';
// import 'dashboard_files/courses.dart';
// import 'dashboard_files/fee_chart.dart';
// import 'dashboard_files/home.dart';
//
// class PersistBottom extends StatefulWidget {
//   const PersistBottom({Key? key}) : super(key: key);
//
//   @override
//   State<PersistBottom> createState() => _PersistBottomState();
// }
//
// class _PersistBottomState extends State<PersistBottom> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//         tabBar: CupertinoTabBar(
//           activeColor: Colors.red,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.book), label: "Quran"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.play_lesson), label: "Courses"),
//             BottomNavigationBarItem(icon: Icon(Icons.payments), label: "Fee"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.app_registration), label: "Register"),
//           ],
//         ),
//         tabBuilder: (context, index) {
//           switch (index) {
//             case 0:
//               return CupertinoTabView(
//                 builder: (context) {
//                   return const CupertinoPageScaffold(child: Home());
//                 },
//               );
//
//             case 1:
//               return CupertinoTabView(
//                 builder: (context) {
//                   return const CupertinoPageScaffold(child: QuranButton());
//                 },
//               );
//             case 2:
//               return CupertinoTabView(
//                 builder: (context) {
//                   return const CupertinoPageScaffold(child: Courses());
//                 },
//               );
//             case 3:
//               return CupertinoTabView(
//                 builder: (context) {
//                   return const CupertinoPageScaffold(child: Fee());
//                 },
//               );
//             case 4:
//               return CupertinoTabView(
//                 builder: (context) {
//                   return const CupertinoPageScaffold(child: Register());
//                 },
//               );
//           }
//           return Container();
//         });
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tasleem_al_quran/bottom_navigation_files/about_us.dart';

import '../bottom_navigation_files/Register.dart';
import '../bottom_navigation_files/courses.dart';
import '../bottom_navigation_files/fee_chart.dart';

import '../bottom_navigation_files/my_menue.dart';

class PersistBottom extends StatefulWidget {
  static String id = "Persist";
  const PersistBottom({Key? key}) : super(key: key);

  @override
  State<PersistBottom> createState() => _PersistBottomState();
}

final controller = PersistentTabController(initialIndex: 0);
List<Widget> _buildScreen() {
  return [
    MyMenue(),
    const OurTeam(),
    const Courses(),
    const Fee(),
    const Register()
  ];
}

List<PersistentBottomNavBarItem> _navBarItem() {
  return [
    PersistentBottomNavBarItem(
        title: "Home",
        activeColorPrimary:  const Color.fromRGBO(10, 91, 144, 1),
        inactiveIcon: const Icon(
          FontAwesomeIcons.house,size: 22,
          color: Color.fromRGBO(10, 91, 144, 1),
        ),
        icon: const Icon(
          Icons.home,
          color: Color.fromRGBO(10, 91, 144, 1),
        )),
    PersistentBottomNavBarItem(
        title: "About Us",
        activeColorPrimary:  const Color.fromRGBO(10, 91, 144, 1),
        icon:  const Icon(
          FontAwesomeIcons.peopleGroup,
          color: Color.fromRGBO(10, 91, 144, 1),
        )),
    PersistentBottomNavBarItem(
        title: "Courses",
        activeColorPrimary:  const Color.fromRGBO(10, 91, 144, 1),
        icon: const Icon(
          FontAwesomeIcons.chalkboard,
          color: Color.fromRGBO(10, 91, 144, 1),
        )),
    PersistentBottomNavBarItem(
        title: "Fee",
        activeColorPrimary:  const Color.fromRGBO(10, 91, 144, 1),
        icon: const Icon(
          FontAwesomeIcons.moneyBill,
          color: Color.fromRGBO(10, 91, 144, 1),
        )),
    PersistentBottomNavBarItem(
        title: "Register",
        activeColorPrimary:  const Color.fromRGBO(10, 91, 144, 1),
        icon: const Icon(
          Icons.app_registration,
          color: Color.fromRGBO(10, 91, 144, 1),
        )),
  ];
}

class _PersistBottomState extends State<PersistBottom> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(

      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      controller: controller,
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style3,
      hideNavigationBarWhenKeyboardShows: true,
    );
  }
}
