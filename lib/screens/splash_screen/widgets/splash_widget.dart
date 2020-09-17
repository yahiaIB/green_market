import '../../../theme/custom_assets.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 23,right: 20),
        child: Image.asset(
          CustomAssets.logo,
        ),
      ),
    );
  }
}
