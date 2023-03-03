// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'dart:async';
//
// import '../not_used_files/bottom_navigation_bar.dart';
//
// class SplashScreen extends StatefulWidget {
//   static String id = "splash_screen";
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animation;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       duration: const Duration(
//         seconds: 3,
//       ),
//       vsync: this,
//     );
//
//     animation = Tween(begin: 0.0, end: 1.0).animate(controller)
//       ..addListener(() {
//         setState(() {});
//       });
//
//     controller.forward();
//     loadData();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }
//
//   Future<Timer> loadData() async {
//     return new Timer(const Duration(seconds: 4), onDoneLoading);
//   }
//
//   onDoneLoading() async {
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => MyNavigationBar(),
//     ));
//
//
//   }
//
//   final purpleOpicity = Container(
//     color: const Color.fromRGBO(10, 91, 144, 0.5),
//   );
//
//   final motiveText = const Text(
//     'Learn Qur’an Online with us and Spread the Knowledge of Qur’an.',
//     style: TextStyle(fontSize: 15, height: 2.0, color: Colors.white),
//     textAlign: TextAlign.center,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//
//     final logoPic = ScaleTransition(
//       scale: animation,
//       child: Image.asset(
//         'assets/tasleemalquranlogo.png',
//         width: 250.0,
//         height: 170.0,
//       ),
//     );
//
//     final welcomeText = FadeTransition(
//       opacity: animation,
//       child: SlideTransition(
//         position:
//             Tween<Offset>(begin: const Offset(0.0, -0.8), end: Offset.zero)
//                 .animate(controller),
//         child: const Text(
//           'Welcome to Tasleem Al-Quran Academy!',
//           style: TextStyle(
//               fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//
//     return Scaffold(
//       // bottomNavigationBar: BottomNavigation(),
//       body: SafeArea(
//         child: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             // KBackground(
//             //   assetImage: 'assets/splashbackground2.jpg',
//             // ),
//             purpleOpicity,
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 logoPic,
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 welcomeText,
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 motiveText,
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
