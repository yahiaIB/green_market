import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  TitleWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
    );
  }
}
