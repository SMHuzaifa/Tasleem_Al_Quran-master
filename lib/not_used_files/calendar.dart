// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:hijri/digits_converter.dart';
// import 'package:hijri/hijri_array.dart';
// import 'package:hijri/hijri_calendar.dart';
//
//
// class HijriCalendar extends StatefulWidget {
//   @override
//   _HijriCalendarState createState() => _HijriCalendarState();
// }
//
// class _HijriCalendarState extends State<HijriCalendar> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _selectedDay = DateTime.now();
//   HijriCalendar _hijriDate = Hijri.
//   Map<DateTime, List> _events = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       calendarFormat: _calendarFormat,
//       selectedDayPredicate: (date) => isSameDay(date, _selectedDay),
//       onDaySelected: _onDaySelected,
//       calendarStyle: CalendarStyle(
//         todayColor: Colors.blueGrey[200],
//         selectedColor: Colors.blueGrey[400],
//         todayStyle: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 18.0,
//           color: Colors.white,
//         ),
//       ),
//       headerStyle: HeaderStyle(
//         centerHeaderTitle: true,
//         formatButtonVisible: false,
//       ),
//       events: _events,
//       calendarBuilders: CalendarBuilders(
//         selectedBuilder: (context, date, events) => Container(
//           margin: const EdgeInsets.all(4.0),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Text(
//             '${HijriCalendar.fromDate(date).hDay}',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         todayBuilder: (context, date, events) => Container(
//           margin: const EdgeInsets.all(4.0),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Colors.blueGrey[200],
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Text(
//             '${HijriCalendar.fromDate(date).hDay}',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ), focusedDay: ,
//     );
//   }
//
//   void _onDaySelected(DateTime day, List events, List holidays) {
//     setState(() {
//       _selectedDay = day;
//       _hijriDate = HijriCalendar.fromDate(day);
//     });
//   }
// }
