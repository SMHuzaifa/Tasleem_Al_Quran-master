import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function onClickCallBack;

  HomeCard({required this.imagePath, required this.title,required this.onClickCallBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickCallBack(),
      child: Container(
        height: 115,
        width: 143,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: ExactAssetImage('assets/images/$imagePath')),
              SizedBox(height: 3),
              Text(
                "$title",
                style: TextStyle(
                    color: Color(0xff4878B8), fontWeight: FontWeight.bold,fontFamily: 'roboto'),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
