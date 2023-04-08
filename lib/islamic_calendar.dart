import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Islamic Calender'),
        centerTitle: true,
        backgroundColor:  const Color.fromRGBO(10, 91, 144, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            JGlobalDatePicker(
              widgetType: WidgetType.JContainer,
              pickerType: PickerType.JHijri,
              buttons: const SizedBox(),
              primaryColor: Colors.green,
              calendarTextColor: Colors.white,
              backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
              borderRadius: const Radius.circular(10),
              headerTitle: const Center(
                child: Text("التقويم الهجري",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25
                ),),
              ),

              startDate: JDateModel(dateTime: DateTime.parse("1984-12-24")),
              selectedDate: JDateModel(dateTime: DateTime.now()),
              endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),
              pickerMode: DatePickerMode.day,
              pickerTheme: Theme.of(context),
              textDirection: TextDirection.rtl,
              onChange: (val) {
                debugPrint(val.toString());
              },
            ),
            JGlobalDatePicker(
              widgetType: WidgetType.JContainer,
              pickerType: PickerType.JNormal,
              buttons: const SizedBox(),
              primaryColor: Colors.green,
              calendarTextColor: Colors.white,
              backgroundColor: const Color.fromRGBO(10, 91, 144, 1),
              borderRadius: const Radius.circular(10),
              headerTitle: const Center(
                child: Text("التقويم الميلادي",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25
                )),
              ),
              startDate: JDateModel(dateTime: DateTime.parse("1984-12-24")),
              selectedDate: JDateModel(dateTime: DateTime.now()),
              endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),
              pickerMode: DatePickerMode.day,
              pickerTheme: Theme.of(context),
              textDirection: TextDirection.rtl,
              onChange: (val) {
                debugPrint(val.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
