import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:tasleem_al_quran/compass/qibla.dart';



class Location extends StatefulWidget {
  static String id = "location";
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          builder: (context, snapshot) {
            if (hasPermission) {
              return const QiblahScreen();
            } else {
              return const Scaffold(
                backgroundColor: Color.fromARGB(255, 48, 48, 48),
              );
            }
          },
          future: getPermission(),
        ));
  }
}