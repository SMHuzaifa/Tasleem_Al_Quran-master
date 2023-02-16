import 'package:flutter/material.dart';

import 'package:tasleem_al_quran/namaz_timing_file/json_connection.dart';

class PrayTimes extends StatefulWidget {
  static String id = "Home";

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {
  JsonConnection jsonConnection = JsonConnection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pray Times'),
        backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
      ),
      body: FutureBuilder(
        //initialData: true,
        future: jsonConnection.getPTLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if(snapshot.connectionState == ConnectionState.waiting){
          //   return Center(child: CircularProgressIndicator());
          // }
          // if(snapshot.connectionState == ConnectionState.none){
          //   return CircularProgressIndicator();
          // }

          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: <Widget>[
                        Card(
                            color: const Color.fromRGBO(10, 91, 144, 1),
                            child: Text(snapshot.data.data.meta.timezone,
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Card(
                              color: const Color.fromRGBO(10, 91, 144, 1),
                              elevation: 3,
                              child: Row(
                                children: [
                                  const Text(
                                    'Fajr',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    width: 178,
                                  ),
                                  Text(
                                    snapshot.data.data.timings.fajr,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              color: const Color.fromRGBO(10, 91, 144, 1),
                              elevation: 3,
                              child: Row(
                                children: [
                                  const Text(
                                    'Dhuhr',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    width: 150,
                                  ),
                                  Text(snapshot.data.data.timings.dhuhr,
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ],
                              ),
                            ),
                            Card(
                              color: const Color.fromRGBO(10, 91, 144, 1),
                              elevation: 3,
                              child: Row(
                                children: [
                                  const Text(
                                    'Asr',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    width: 185,
                                  ),
                                  Text(snapshot.data.data.timings.asr,
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ],
                              ),
                            ),
                            Card(
                              color: const Color.fromRGBO(10, 91, 144, 1),
                              elevation: 3,
                              child: Row(
                                children: [
                                  const Text(
                                    'Maghrib',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    width: 120,
                                  ),
                                  Text(snapshot.data.data.timings.maghrib,
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ],
                              ),
                            ),
                            Card(
                              color: const Color.fromRGBO(10, 91, 144, 1),
                              elevation: 3,
                              child: Row(
                                children: [
                                  const Text(
                                    'Isha',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    width: 173,
                                  ),
                                  Text(snapshot.data.data.timings.isha,
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
