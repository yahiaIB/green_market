import 'package:flutter/material.dart';
import '../constants/profile_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PresonalDataCard extends StatelessWidget {
  String data;
  IconData icon;

  @required
  PresonalDataCard({this.data, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kLightSecondaryColor,
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Stack(
        children: [
          ListTile(
            leading: Icon(
              icon,
              size: kSpacingUnit * 2.5,
            ),
            title: Text(
              data,
              style: kTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
