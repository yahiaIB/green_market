import 'package:flutter/material.dart';

class ImageTextWidget extends StatelessWidget {

  final String image;
  final String text;
  final double paddingBetween;
  double width;

  ImageTextWidget({this.text,this.image,this.paddingBetween = 15,this.width});

  @override
  Widget build(BuildContext context) {
    if(width == null){
      width = MediaQuery.of(context).size.width / 3;
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(image,width: width,),
          SizedBox(height: paddingBetween,),
          Text(text)
        ],
      ),
    );
  }
}
