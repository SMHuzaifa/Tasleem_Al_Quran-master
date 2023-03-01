import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasleem_al_quran/quran_files/models/aya_of_the_day.dart';
import 'package:tasleem_al_quran/quran_files/screens/qari_screen.dart';
import 'package:tasleem_al_quran/quran_files/screens/quran_screen.dart';
import 'package:tasleem_al_quran/quran_files/services/api_services.dart';

class QuranButton extends StatefulWidget {
  const QuranButton({Key? key}) : super(key: key);

  @override
  _QuranButtonState createState() => _QuranButtonState();
}

class _QuranButtonState extends State<QuranButton> {
  final ApiServices _apiServices = ApiServices();
  //
  // void setData()async{
  //   // Obtain shared preferences.
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("alreadyUsed", true);
  // }
  //
  // @override
  //  void initState() {
  //    // TODO: implement initState
  //    super.initState();
  //    setData();
  //  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.22, // 22% of screen
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background_img.jpg'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 40, 40, 6),
                    child: Text(
                      formatted,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 40, 25),
                    child: RichText(
                      text: TextSpan(children: <InlineSpan>[
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.hDay.toString(),
                              style: const TextStyle(
                                  fontSize: 27, color: Colors.white),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.longMonthName,
                              style: const TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              '${_hijri.hYear} AH',
                              style: const TextStyle(
                                  fontSize: 27, color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
                child: Column(
                  children: [
                    FutureBuilder<AyaOfTheDay>(
                      future: _apiServices.getAyaOfTheDay(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Icon(Icons.sync_problem);
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return const CircularProgressIndicator();
                          case ConnectionState.done:
                            return Container(
                              margin: const EdgeInsetsDirectional.all(16),
                              padding: const EdgeInsetsDirectional.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  const Text(
                                    "Quran Aya of the Day",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 0.5,
                                  ),
                                  Text(
                                    snapshot.data!.arText!,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    snapshot.data!.enTran!,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  RichText(
                                    text: TextSpan(children: <InlineSpan>[
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data!.surNumber!
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(snapshot.data!.surEnName!,
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 20.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              foregroundColor:
                                  const Color.fromRGBO(10, 91, 144, 1),
                              backgroundColor:
                                  const Color.fromRGBO(10, 91, 144, 1),
                              //onPrimary: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, QuranScreen.id);
                            },
                            child: const Text(
                              "Read Online Quran",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 20.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              foregroundColor:
                                  const Color.fromRGBO(10, 91, 144, 1),
                              backgroundColor:
                                  const Color.fromRGBO(10, 91, 144, 1),
                              //onPrimary: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, QariListScreen.id);
                            },
                            child: const Text(
                              "Listen Online Quran",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
