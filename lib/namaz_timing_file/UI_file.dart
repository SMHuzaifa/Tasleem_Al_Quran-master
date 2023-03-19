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
        title: const Text('Prayer Times'),
        centerTitle: true,
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
            return Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0Xffffecd2),Color(0Xfffcb69f)
                  ]
                )
              ),
              child: Center(
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
                      child: Column(
                        children: <Widget>[
                          Container(


                            color: const Color.fromRGBO(10, 91, 144, 1),
                            height: 65,
                            child: ListTile(
                              isThreeLine: true,

                              title: const Text(
                                "Fajr",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),

                              subtitle: Text(snapshot.data.data.timings.fajr,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              trailing: const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              // dense: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(

                            color: const Color.fromRGBO(10, 91, 144, 1),
                            height: 65,
                            child: ListTile(
                              isThreeLine: true,

                              title: const Text(
                                "Dhuhr",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),

                              subtitle: Text(snapshot.data.data.timings.dhuhr,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              trailing: const Icon(
                                Icons.sunny,
                                color: Colors.yellow,
                              ),
                              // dense: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: const Color.fromRGBO(10, 91, 144, 1),
                            height: 65,
                            child: ListTile(
                              isThreeLine: true,

                              title: const Text(
                                "Asr",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),

                              subtitle: Text(snapshot.data.data.timings.asr,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              trailing: const Icon(
                                Icons.sunny_snowing,
                                color: Colors.yellow,
                              ),
                              // dense: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: const Color.fromRGBO(10, 91, 144, 1),
                            height: 65,
                            child: ListTile(
                              isThreeLine: true,

                              title: const Text(
                                "Maghrib",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),

                              subtitle: Text(snapshot.data.data.timings.maghrib,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              trailing: const Icon(
                                Icons.sunny_snowing,
                                color: Colors.yellow,
                              ),
                              // dense: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: const Color.fromRGBO(10, 91, 144, 1),
                            height: 65,
                            child: ListTile(
                              isThreeLine: true,

                              title: const Text(
                                "Isha",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),

                              subtitle: Text(snapshot.data.data.timings.isha,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              trailing: const Icon(
                                Icons.sunny_snowing,
                                color: Colors.yellow,
                              ),
                              // dense: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
