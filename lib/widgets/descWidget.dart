import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String desc;

  DescriptionWidget({this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      child: Text(
        desc,
        style: TextStyle(color: Colors.black, fontSize: 17),
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
      ),
    );
  }
}
