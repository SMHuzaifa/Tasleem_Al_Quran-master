import 'package:flutter/material.dart';

import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'package:tasleem_al_quran/qibla_files/qibla_compass.dart';

class Compass extends StatefulWidget {
  static String id = "Compass";
  @override
  _Compass createState() => _Compass();
}

class _Compass extends State<Compass> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(

            backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
            title:  const Text(
              'Qibla Direction',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: _deviceSupport,
            builder: (_, AsyncSnapshot<bool?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error.toString()}"),
                );
              }
              if (snapshot.data!) {
                return const QiblahCompass();
              } else {
                return   Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Image(height:100,width:100,color:Colors.red,image: AssetImage('assets/qibla_icon.png')),
                      const SizedBox(height: 32),
                      const Text(
                        "Your device does not have Magnetometer\n sensor for qibla diection",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        child: const Text("Back"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                );
              }
            },
          ),

      ),
    );
  }
}
