import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {

  final String image;
  final List<Color> colors;

  CircleImageWidget({this.image, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      padding: EdgeInsets.only(right: 25,left: 35,top: 30,bottom: 30),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            stops: [0, 1],
            begin: Alignment(-1.00, 0.00),
            end: Alignment(1.00, -0.00),
          )),
      child: Center(
          child: Image.asset(
            image,
            fit: BoxFit.fitHeight,
          )),
    );
  }
}
