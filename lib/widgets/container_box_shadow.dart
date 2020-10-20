import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class ContainerBoxShadow extends StatelessWidget {
  final Widget child;
  const ContainerBoxShadow({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: CustomColors.mainColor.withOpacity(0.05),
            offset: Offset(0, 3),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
