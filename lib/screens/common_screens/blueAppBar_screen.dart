import 'package:flutter/material.dart';

class BlueAppBarScreen extends StatelessWidget {
  final Widget childWidget;

  BlueAppBarScreen({this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(top: 70),
      child: Container(
        height: MediaQuery.of(context).size.height - 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: childWidget,
      ),
    );
  }
}
