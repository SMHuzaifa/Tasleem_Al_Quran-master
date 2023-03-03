// import 'package:flutter/material.dart';
// import 'package:tasleem_al_quran/dashboard_files/quran_button.dart';
//
// import 'package:tasleem_al_quran/quran_files/constants/constants.dart';
// import 'package:tasleem_al_quran/quran_files/screens/home_screen.dart';
// import 'package:tasleem_al_quran/quran_files/screens/qari_screen.dart';
// import 'package:tasleem_al_quran/quran_files/screens/quran_screen.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int selectindex = 0;
//   final List<Widget> _widgetsList = [
//     const HomeScreen(),
//      QuranScreen(),
//     const QariListScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: _widgetsList[selectindex],
//             bottomNavigationBar: BottomNavigationBar(
//               selectedItemColor: Colors.red,
//               unselectedItemColor: const Color.fromRGBO(10, 91, 144, 1),
//               items: const [
//                 BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Daily Ayat'),
//                 BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.volume_down), label: 'Audio'),
//               ],
//               //  initialActiveIndex: 0, //optional, default as 0
//               onTap: updateIndex,
//               backgroundColor: Colors.white,
//               currentIndex: selectindex,
//               //activeColor: Constants.kPrimary,
//             )));
//   }
//
//   void updateIndex(index) {
//     setState(() {
//       selectindex = index;
//     });
//   }
// }
