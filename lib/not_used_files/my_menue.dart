// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:flutter/cupertino.dart';
// //import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:tasleem_al_quran/home.dart';
//
// import 'package:tasleem_al_quran/pag3.dart';
//
//
// class MyMenue extends StatelessWidget {
//   static String id = "MyMenue_id";
//
//   MyMenue({super.key});
//
//   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
//     // onPrimary: Colors.black87,
//     primary: const Color.fromRGBO(10, 91, 144, 1),
//     // primary: Colors.grey[300],
//     maximumSize: const Size(88, 75),
//     elevation: 15,
//     minimumSize: const Size(88, 36),
//     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//   );
//
//   final purpleOpicity =
//       Container(color: const Color.fromRGBO(104, 210, 223, 0.8));
//
//   final Color active = const Color(0xBAFFFFFF);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//        Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Tasleem Al-Quran Academy',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
//           automaticallyImplyLeading: false,
//         ),
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Stack(
//               children: <Widget>[
//                 SizedBox(
//                   height: 180,
//                   width: 360,
//                   child: Carousel(
//                     images: [
//                       Image.asset('assets/1.png'),
//                       Image.asset('assets/2.png'),
//                       Image.asset('assets/3.png'),
//                       Image.asset('assets/4.png')
//                     ],
//                     indicatorBgPadding: 3.0,
//                     dotSize: 3.5,
//                     dotSpacing: 15,
//                     dotColor: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(25.0, 200.0, 25.0, 80.0),
//                   decoration: BoxDecoration(
//                       color: const Color.fromRGBO(10, 91, 144, 0.4),
//                       borderRadius: BorderRadius.circular(15.0)),
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Page2()),
//                               // );
//                               Navigator.pushNamed(context, Page1.id);
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'About US',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.5,
//                                 ),
//                                 Image.asset('assets/homeIcon (2).png'),
//                               ],
//                             ),
//                           )),
//                           const SizedBox(
//                             width: 10.0,
//                           ),
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Page2()),
//                               // );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'Who We Are',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.5,
//                                 ),
//                                 Image.asset('assets/personIcon.png')
//                               ],
//                             ),
//                           )),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Page3()),
//                               // );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'Our Team',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.1,
//                                 ),
//                                 Image.asset('assets/teamIcon.png'),
//                               ],
//                             ),
//                           )),
//                           const SizedBox(
//                             width: 10.0,
//                           ),
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Home()),
//                               // );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'Courses',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.1,
//                                 ),
//                                 Image.asset('assets/courseIcon.png'),
//                               ],
//                             ),
//                           )),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Home()),
//                               // );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'Fee Chart',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.1,
//                                 ),
//                                 Image.asset('assets/feeIcon.png'),
//                               ],
//                             ),
//                           )),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Home()),
//                               // );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'Blog',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.1,
//                                 ),
//                                 Image.asset('assets/blogIcon.png'),
//                               ],
//                             ),
//                           )),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Home()),
//                               // );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'Get Register',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.1,
//                                 ),
//                                 Image.asset('assets/registerIcon.png'),
//                               ],
//                             ),
//                           )),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                               child: ElevatedButton(
//                             style: raisedButtonStyle,
//                             onPressed: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Home()),
//                               // );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 const Text(
//                                   'Contact US',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 const SizedBox(
//                                   height: 0.1,
//                                 ),
//                                 Image.asset('assets/contactIcon.png'),
//                               ],
//                             ),
//                           )),
//                         ],
//                       ),
//                       // const SizedBox(
//                       //   height: 10.0,
//                       // ),
//
//                     ],
//
//                   ),
//
//                 ),
//
//               ],
//             ),
//
//           ),
//
//         ),
//
//
//     );
//   }
// }
