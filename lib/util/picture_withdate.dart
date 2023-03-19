import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class PicDate extends StatefulWidget {
  const PicDate({Key? key}) : super(key: key);

  @override
  State<PicDate> createState() => _PicDateState();
}

class _PicDateState extends State<PicDate> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);

    return Container(
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
            padding: const EdgeInsets.fromLTRB(65, 40, 40, 6),
            child: Text(
              formatted,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(73, 0, 40, 25),
            child: RichText(
              text: TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
                    child: Text(
                      _hijri.hDay.toString(),
                      style: const TextStyle(fontSize: 27, color: Colors.white),
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
                      style: const TextStyle(fontSize: 27, color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
