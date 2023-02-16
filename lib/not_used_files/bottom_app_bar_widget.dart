import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget{
  final IconData iconData;
  final String text;
  final Function callback;
  final bool isSelected;
  const BottomAppBarWidget({super.key, required this.iconData,required this.text,required this.callback,required this.isSelected, required Null Function() onTappedBar});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(


      onTap: callback(),


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(iconData,color: isSelected?const Color(0xff8FB8EF):Colors.grey,),
          Text("$text",style: TextStyle(fontSize: 10,color: Color(0xff2A2A2A)),)
        ],),
    );
  }
}