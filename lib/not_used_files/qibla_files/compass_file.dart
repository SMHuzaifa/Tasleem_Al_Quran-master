// import 'package:flutter/material.dart';
//
// import 'package:flutter_qiblah/flutter_qiblah.dart';
//
//
//
//
//
// class Compass extends StatefulWidget {
//   static String id = "Compass";
//   @override
//   _Compass createState() => _Compass();
// }
//
// class _Compass extends State<Compass> {
//   final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: FutureBuilder(
//           future: _deviceSupport,
//           builder: (_, AsyncSnapshot<bool?> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text("Error: ${snapshot.error.toString()}"),
//               );
//             }
//             if (snapshot.data!) {
//               return QiblahCompass();
//             } else {
//               return const Center(
//                 child: Text("Your device is not supported"),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }