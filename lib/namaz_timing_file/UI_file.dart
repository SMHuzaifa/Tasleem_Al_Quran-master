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
              decoration:  BoxDecoration(
                   color: Colors.black12.withOpacity(0.01)),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 30, top: 30),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(10, 91, 144, 1),
                            ),
                            child: Text(
                                '📍 ${snapshot.data.data.meta.timezone}',
                                style: const TextStyle(
                                    fontSize: 28, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(10, 91, 144, 1),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                             color: Colors.white38
                            ),
                            height: 65,
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/fajar.ico'),
                                const Text(
                                  "Fajar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(snapshot.data.data.timings.fajr,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ],
                            )
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                  color: Colors.white38
                              ),
                              height: 65,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/zuhr.png',height: 35,),
                                  const Text(
                                    "Zuhar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(snapshot.data.data.timings.dhuhr,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ],
                              )
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white38
                              ),
                              height: 65,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/asr.png',height: 35,),
                                  const Text(
                                    "Asar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(snapshot.data.data.timings.asr,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ],
                              )
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white38
                              ),
                              height: 65,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/maghrib.png',height: 35,),
                                  const Text(
                                    "Maghrib",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(snapshot.data.data.timings.maghrib,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ],
                              )
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white38
                              ),
                              height: 65,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/night.png',height: 35,),
                                  const Text(
                                    "Isha",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(snapshot.data.data.timings.isha,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ],
                              )
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
