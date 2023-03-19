// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:hijri/hijri_calendar.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hijri Calendar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay = DateTime.now();
//   HijriCalendar _hijriDate = HijriCalendar.now();
//
//   void _onFormatChanged(CalendarFormat format) {
//     setState(() {
//       _calendarFormat = format;
//     });
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = selectedDay;
//       _focusedDay = focusedDay;
//       _hijriDate = HijriCalendar.fromDate(selectedDay);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hijri Calendar"),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           TableCalendar<HijriCalendar>(
//             calendarFormat: _calendarFormat,
//             focusedDay: _focusedDay,
//             firstDay: HijriCalendar.now().hDay,
//             lastDay: HijriCalendar.now().add(Duration(days: 365 * 10)),
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: _onDaySelected,
//             calendarBuilders: CalendarBuilders(
//               // Build Hijri date text below the Gregorian date
//               defaultBuilder: (context, date, events) => Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(date.day.toString()),
//                   Text(
//                     HijriCalendar.fromDate(date).toFormat("dd MMMM yyyy"),
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';
// // import 'package:hijri/hijri_calendar.dart';
// // import 'package:hijri_picker/hijri_picker.dart';
// //
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Calander();
// //   }
// // }
// //
// // class Calander extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         title: 'Flutter Demo',
// //         localizationsDelegates: [
// //           GlobalMaterialLocalizations.delegate,
// //           GlobalWidgetsLocalizations.delegate,
// //         ],
// //         supportedLocales: [
// //           //     const Locale('en', 'USA'),
// //           const Locale('ar', 'SA'),
// //         ],
// //         debugShowCheckedModeBanner: false,
// //         theme: ThemeData(
// //           primaryColor: Colors.brown,
// //           accentColor: Colors.green,
// //           brightness: Brightness.dark,
// //         ),
// //         home: MyHomePage(title: "Umm Alqura Calendar"));
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   var selectedDate;
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     selectedDate = HijriCalendar.now();
// //     _selectDate(context);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);
// //     return  Scaffold(
// //       appBar:  AppBar(
// //         title:  Text(widget.title),
// //       ),
// //       body:  Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Center(
// //           child: HijriDatePickerDialog(
// //             initialDate: selectedDate,
// //             lastDate: HijriCalendar()
// //               ..hYear = 1445
// //               ..hMonth = 9
// //               ..hDay = 25,
// //             firstDate: HijriCalendar()
// //               ..hYear = 1438
// //               ..hMonth = 12
// //               ..hDay = 25,
// //             initialDatePickerMode: DatePickerMode.day,
// //
// //           ) ,
// //
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => _selectDate(context),
// //         tooltip: 'Pick Date',
// //         child: Icon(Icons.event),
// //       ),
// //     );
// //   }
// //
// //   Future<void> _selectDate(BuildContext context) async {
// //      await showHijriDatePicker(
// //       context: context,
// //       initialDate: selectedDate,
// //       lastDate: HijriCalendar()
// //         ..hYear = 1445
// //         ..hMonth = 9
// //         ..hDay = 25,
// //       firstDate: HijriCalendar()
// //         ..hYear = 1438
// //         ..hMonth = 12
// //         ..hDay = 25,
// //       initialDatePickerMode: DatePickerMode.day,
// //     );
// //     // if (picked != null)
// //     //   setState(() {
// //     //     selectedDate = picked;
// //     //   });
// //   }
// // }