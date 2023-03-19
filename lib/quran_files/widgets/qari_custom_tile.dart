import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import '../models/qari.dart';

class QariCustomTile extends StatefulWidget {
  const QariCustomTile({Key? key ,required this.qari,required this.ontap,}) : super(key: key);

  final Qari qari;
  final VoidCallback ontap;


  @override
  _QariCustomTileState createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: widget.ontap,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
          //height: 66,
            //alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 0,
                  color: Colors.black12,
                  offset: Offset(0,1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(FlutterIslamicIcons.solidHadji,color: Color.fromRGBO(10, 91, 144, 1),),
                  trailing: const Icon(FlutterIslamicIcons.quran2,color: Color.fromRGBO(10, 91, 144, 1),),
                  title: Text(widget.qari.name!.toString(),textAlign: TextAlign.start,

                    style: const TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
