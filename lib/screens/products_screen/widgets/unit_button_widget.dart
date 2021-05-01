import 'package:Blwahda/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class UnitButton extends StatelessWidget {
  final IconData icon;
  final Function onTapped;
  UnitButton({@required this.icon, @required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.buttonColor,
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTapped,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
