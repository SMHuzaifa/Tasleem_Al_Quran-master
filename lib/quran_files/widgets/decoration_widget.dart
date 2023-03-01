import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration DecorationWidget(BuildContext context, String text, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon),
    labelText: text,
    contentPadding: EdgeInsets.zero,
    enabledBorder: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Color.fromRGBO(10, 91, 144, 1),
      ),
    ),
    focusColor: Color.fromRGBO(10, 91, 144, 1),
  );
}