import 'package:Vio_Telehealth/screens/profile_screen/constants/profile_constants.dart';
import 'package:Vio_Telehealth/screens/profile_screen/widgets/profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true );

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 15.0,
            width: kSpacingUnit * 15.0,
            margin: EdgeInsets.only(top: kSpacingUnit * 3.0),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit * 10.0,
                  backgroundImage: AssetImage('res/assets/images/m.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit * 2.0),
          Text(
            'Moaz Khaled',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            '0112888277',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 2.0),
          /* Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to PRO',
                style: kButtonTextStyle,
              ),
            ),
          ),*/
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit * 3.0),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit * 3.0),
        ),
        profileInfo,
        //themeSwitcher,
        SizedBox(width: kSpacingUnit * 3.0),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit * 5.0),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_1,
                        text: 'Personal Details',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.address_card,
                        text: 'Addresses',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.history,
                        text: 'Purchase History',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'Help & Support',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.language,
                        text: 'Language',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        hasNavigation: false,
                        color: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),

    );
  }
}
