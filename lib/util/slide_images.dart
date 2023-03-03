import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class SlideImage extends StatelessWidget {
  const SlideImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Carousel(
        images: [
          Image.asset('assets/1.png'),
          Image.asset('assets/2.png'),
          Image.asset('assets/3.png'),
          Image.asset('assets/4.png')
        ],
        indicatorBgPadding: 3.0,
        dotSize: 3.5,
        dotSpacing: 15,
        dotColor: Colors.white,
      ),
    ));
  }
}
