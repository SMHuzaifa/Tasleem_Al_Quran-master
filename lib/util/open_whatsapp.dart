import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:url_launcher/url_launcher.dart';

openWhatsapp() async {
  final Uri phoneNumber = Uri.parse("+923075015849");
  final Uri _urlandroid =
      Uri.parse("whatsapp://send?phone=$phoneNumber&text=Assalam o Alaikum Warahmatullahi  Wabarakatuh!");
  final Uri _urlios =
      Uri.parse("https://wa.me/$phoneNumber?text=${(Uri.parse("Assalam o Alaikum Warahmatullahi  Wabarakatuh!"))}");

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

// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:flutter/services.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await FlutterOpenWhatsapp.platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//             child: MaterialButton(onPressed: (){
//               FlutterOpenWhatsapp.sendSingleMessage("918179015345", "Hello");
//             },
//               child: Text('Running on: $_platformVersion\n'),
//             )
//         ),
//       ),
//     );
//   }
// }
