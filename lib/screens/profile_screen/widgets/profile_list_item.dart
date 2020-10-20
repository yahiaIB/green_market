import 'package:Vio_Telehealth/config/constants.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../constants/profile_constants.dart';
import 'package:Vio_Telehealth/view_models/app_lang.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation, color;
  final Function function;

  const ProfileListItem(
      {Key key,
      this.icon,
      this.text,
      this.hasNavigation = true,
      this.color = true,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        child: GestureDetector(
          onTap: function,
          child: Consumer<AppLanguage>(
            builder: (BuildContext context, AppLanguage languageModel,
                    Widget child) =>
                Container(
              height: kSpacingUnit.w * 5.5,
              // padding: EdgeInsets.symmetric(
              //   horizontal: kSpacingUnit.w * 2,
              // ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: color ? Colors.white : Colors.red.withOpacity(0.2),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 15,
              ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      this.icon,
                      size: kSpacingUnit.w * 2.5,
                    ),
                    SizedBox(width: kSpacingUnit.w * 1.5),
                    Text(
                      this.text,
                      style: kTitleTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    this.hasNavigation
                        ? Icon(
                            languageModel.appLocal == Locale("en")
                                ? LineAwesomeIcons.angle_right
                                : LineAwesomeIcons.angle_left,
                            size: kSpacingUnit.w * 2.5,
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
