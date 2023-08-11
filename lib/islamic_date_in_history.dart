import 'package:flutter/material.dart';
import 'package:tasleem_al_quran/util/picture_withdate.dart';

class IslamicDateInHistory extends StatefulWidget {
  const IslamicDateInHistory({Key? key}) : super(key: key);

  @override
  State<IslamicDateInHistory> createState() => _IslamicDateInHistoryState();
}

class _IslamicDateInHistoryState extends State<IslamicDateInHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Tasleem Al-Quran Academy',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
            //automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              const PicDate(),
              Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
                    child: Column(
                      children: [
                        Container(
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
                          child: const Column(
                            children: [
                              Text(
                                "Today in History",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              ),
                              Text(
                                '	Conversion of Omar ibn al Khattab (r).',
                                style: TextStyle(color: Colors.black54, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 15,),
                              Text(
                                '615 AD',
                                style:
                                TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
