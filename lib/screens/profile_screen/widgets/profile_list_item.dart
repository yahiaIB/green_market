import 'package:Vio_Telehealth/screens/profile_screen/constants/profile_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation, color;

  const ProfileListItem(
      {Key key,
      this.icon,
      this.text,
      this.hasNavigation = true,
      this.color = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: kSpacingUnit * 5.5,
        margin: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 4.0,
        ).copyWith(
          bottom: kSpacingUnit * 2.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 2.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit * 3.0),
          color: color
              ? Theme.of(context).buttonColor
              : Colors.red.withOpacity(0.2),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              this.icon,
              size: kSpacingUnit * 2.5,
            ),
            SizedBox(width: kSpacingUnit  * 1.5),
            Text(
              this.text,
              style: kTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            this.hasNavigation ?
              Icon(
                LineAwesomeIcons.angle_right,
                size: kSpacingUnit * 2.5,
              )
              : Container(),
          ],
        ),
      ),
    );
  }
}
