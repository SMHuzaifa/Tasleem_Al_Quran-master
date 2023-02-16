// import 'package:flutter/material.dart';
//
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
//     show CalendarCarousel;
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/classes/event_list.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:intl/intl.dart' show DateFormat;
//
//
//
// class CalendarPage extends StatelessWidget {
//   static String id = "calendar";
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'dooboolab flutter calendar',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//         // counter didn't reset back to zero; the application is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Calendar Carousel Example'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   DateTime _currentDate = DateTime(2019, 2, 3);
//   DateTime _currentDate2 = DateTime(2019, 2, 3);
//   String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
//   DateTime _targetDateTime = DateTime(2019, 2, 3);
// //  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
//   static final Widget _eventIcon = Container(
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(1000)),
//         border: Border.all(color: Colors.blue, width: 2.0)),
//     child: const Icon(
//       Icons.person,
//       color: Colors.amber,
//     ),
//   );
//
//   final EventList<Event> _markedDateMap = EventList<Event>(
//     events: {
//       DateTime(2019, 2, 10): [
//         Event(
//           date: DateTime(2019, 2, 10),
//           title: 'Event 1',
//           icon: _eventIcon,
//           dot: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 1.0),
//             color: Colors.red,
//             height: 5.0,
//             width: 5.0,
//           ),
//         ),
//         Event(
//           date: DateTime(2019, 2, 10),
//           title: 'Event 2',
//           icon: _eventIcon,
//         ),
//         Event(
//           date: DateTime(2019, 2, 10),
//           title: 'Event 3',
//           icon: _eventIcon,
//         ),
//       ],
//     },
//   );
//
//   @override
//   void initState() {
//     /// Add more events to _markedDateMap EventList
//     _markedDateMap.add(
//         DateTime(2019, 2, 25),
//         Event(
//           date: DateTime(2019, 2, 25),
//           title: 'Event 5',
//           icon: _eventIcon,
//         ));
//
//     _markedDateMap.add(
//         DateTime(2019, 2, 10),
//         Event(
//           date: DateTime(2019, 2, 10),
//           title: 'Event 4',
//           icon: _eventIcon,
//         ));
//
//     _markedDateMap.addAll(DateTime(2019, 2, 11), [
//       Event(
//         date: DateTime(2019, 2, 11),
//         title: 'Event 1',
//         icon: _eventIcon,
//       ),
//       Event(
//         date: DateTime(2019, 2, 11),
//         title: 'Event 2',
//         icon: _eventIcon,
//       ),
//       Event(
//         date: DateTime(2019, 2, 11),
//         title: 'Event 3',
//         icon: _eventIcon,
//       ),
//     ]);
//     super.initState();
//   }
//   final _today = HijriCalendar.now();
//
//   @override
//   Widget build(BuildContext context) {
//     /// Example with custom icon
//     final calendarCarousel = CalendarCarousel<Event>(
//       onDayPressed: (date, events) {
//         setState(() => _currentDate = date);
//         for (var event in events) {
//           print(event.title);
//         }
//       },
//       weekendTextStyle: const TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Colors.grey,
// //          weekDays: null, /// for pass null when you do not want to render weekDays
//       headerText: '{$_today}',
//       weekFormat: true,
//       markedDatesMap: _markedDateMap,
//       height: 200.0,
//       selectedDateTime: _currentDate2,
//       showIconBehindDayText: true,
// //          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
//       customGridViewPhysics: const NeverScrollableScrollPhysics(),
//       markedDateShowIcon: true,
//       markedDateIconMaxShown: 2,
//       selectedDayTextStyle: const TextStyle(
//         color: Colors.yellow,
//       ),
//       todayTextStyle: const TextStyle(
//         color: Colors.blue,
//       ),
//       markedDateIconBuilder: (event) {
//         return event.icon ?? const Icon(Icons.help_outline);
//       },
//       minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
//       maxSelectedDate: _currentDate.add(const Duration(days: 360)),
//       todayButtonColor: Colors.transparent,
//       todayBorderColor: Colors.green,
//       markedDateMoreShowTotal:
//       true, // null for not showing hidden events indicator
// //          markedDateIconMargin: 9,
// //          markedDateIconOffset: 3,
//     );
//
//     /// Example Calendar Carousel without header and custom prev & next button
//     final calendarCarouselNoHeader = CalendarCarousel<Event>(
//       todayBorderColor: Colors.green,
//       onDayPressed: (date, events) {
//         setState(() => _currentDate2 = date);
//         events.forEach((event) => print(event.title));
//       },
//       daysHaveCircularBorder: true,
//       showOnlyCurrentMonthDate: false,
//       weekendTextStyle: const TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Colors.grey,
//       weekFormat: false,
// //      firstDayOfWeek: 4,
//       markedDatesMap: _markedDateMap,
//       height: 420.0,
//       selectedDateTime: _currentDate2,
//       targetDateTime: _targetDateTime,
//       customGridViewPhysics: const NeverScrollableScrollPhysics(),
//       markedDateCustomShapeBorder:
//       const CircleBorder(side: BorderSide(color: Colors.yellow)),
//       markedDateCustomTextStyle: const TextStyle(
//         fontSize: 18,
//         color: Colors.blue,
//       ),
//       showHeader: false,
//       todayTextStyle: const TextStyle(
//         color: Colors.blue,
//       ),
//       // markedDateShowIcon: true,
//       // markedDateIconMaxShown: 2,
//       // markedDateIconBuilder: (event) {
//       //   return event.icon;
//       // },
//       // markedDateMoreShowTotal:
//       //     true,
//       todayButtonColor: Colors.yellow,
//       selectedDayTextStyle: const TextStyle(
//         color: Colors.yellow,
//       ),
//       minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
//       maxSelectedDate: _currentDate.add(const Duration(days: 360)),
//       prevDaysTextStyle: const TextStyle(
//         fontSize: 16,
//         color: Colors.pinkAccent,
//       ),
//       inactiveDaysTextStyle: const TextStyle(
//         color: Colors.tealAccent,
//         fontSize: 16,
//       ),
//       onCalendarChanged: (DateTime date) {
//         setState(() {
//           _targetDateTime = date;
//           _currentMonth = DateFormat.yMMM().format(_targetDateTime);
//         });
//       },
//       onDayLongPressed: (DateTime date) {
//         print('long pressed date $date');
//       },
//     );
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               //custom icon
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: calendarCarousel,
//               ), // This trailing comma makes auto-formatting nicer for build methods.
//               //custom icon without header
//               Container(
//                 margin: const EdgeInsets.only(
//                   top: 30.0,
//                   bottom: 16.0,
//                   left: 16.0,
//                   right: 16.0,
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                         child: Text(
//                           '{$_today.hMonth}',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24.0,
//                           ),
//                         )),
//                     TextButton(
//                       child: const Text('PREV'),
//                       onPressed: () {
//                         setState(() {
//                           _targetDateTime = DateTime(
//                               _targetDateTime.year, _targetDateTime.month - 1);
//                           _currentMonth =
//                               DateFormat.yMMM().format(_targetDateTime);
//                         });
//                       },
//                     ),
//                     TextButton(
//                       child: const Text('NEXT'),
//                       onPressed: () {
//                         setState(() {
//                           _targetDateTime = DateTime(
//                               _targetDateTime.year, _targetDateTime.month + 1);
//                           _currentMonth =
//                               DateFormat.yMMM().format(_targetDateTime);
//                         });
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: calendarCarouselNoHeader,
//               ), //
//             ],
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';

import 'package:hijri/hijri_calendar.dart';



class Calendar extends StatelessWidget {
  static String id = "Fee_id";
  var hijri = HijriCalendar.now();
  late int daysInMonth;

  @override
  Widget build(BuildContext context) {
    daysInMonth = hijri.hMonth;
    return Scaffold(
      body: Column(
        children: [
          Text(
            hijri.format('1425','2','2','2'),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: daysInMonth,
              itemBuilder: (context, index) {
                hijri = HijriCalendar();
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      hijri.format('1425','2','3','1'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}