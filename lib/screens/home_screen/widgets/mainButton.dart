import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({@required this.textLabel, @required this.onPress});

  final String textLabel;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Material(
          borderRadius: BorderRadius.circular(29.0),
          elevation: 5.0,
          child: MaterialButton(
            onPressed: onPress,
            minWidth: 150.0,
            height: 50.0,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29.0),
            ),
            child: Text(
              textLabel,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
