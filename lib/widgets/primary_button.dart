import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function buttonAction;
  final String text;
  final Color color;
  double textSize ;
  double paddingTopBottom;
  double paddingRightLeft;
  Icon icon;

  PrimaryButton(this.buttonAction, this.text,
      {this.textSize = 16, this.paddingRightLeft = 15, this.paddingTopBottom = 15 , this.color =CustomColors.buttonColor,this.icon });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:() {buttonAction();},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      padding: EdgeInsets.only(
          top: paddingTopBottom,
          bottom: paddingTopBottom,
          right: paddingRightLeft,
          left: paddingRightLeft),
      color: color,
      textColor: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon != null? icon:SizedBox(),
          icon != null? SizedBox(width: 5,):SizedBox(),
          Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
