
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




//
// class Qari {
//   List<dynamic>? name;
//   String? path;
//   String? format;
//
//   Qari({this.name, this.path, this.format});
//
//   factory Qari.fromJson(Map<String, dynamic> json) {
//     final nameField = json['name'];
//     final name = (nameField == null)
//         ? []
//         : (nameField is String)
//         ? nameField.split(' ').take(3).toList()
//         : (nameField as List<dynamic>).take(2).cast<String>().toList();
//
//     return Qari(
//       name: name,
//       path: json['relative_path'],
//       format: json['file_formats'],
//     );
//   }
//
//
//
//   @override
//   String toString() {
//     return '${name!.join(' ')} ${format ?? ''}';
//   }
// }














class Qari {
  String? name;
  String? path;
  String? format;
  //Image? image; // add image property

  Qari({this.name, this.path, this.format, });

  factory Qari.fromjson(Map<String, dynamic> json) {
    return Qari(
      name: json['name'],
      path: json['relative_path'],
      format: json['file_formats'],
    );
  }


}



