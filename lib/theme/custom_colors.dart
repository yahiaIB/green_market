import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomColors {
  //TODO Define your colors here
  CustomColors();
  // static const Color buttonColor = Color(0xfffa5e62);
  static const Color buttonColor = Color(0xffF5BF2C);
  static final Color background = Color(0xfff8f8f8);
  static final Color primaryColorLight = ColorHex("#E5183B");
  static final Color thirdColorLight = ColorHex("#ff8e33");

  // static final Color mainColor = ColorHex("#F85558");
  static final Color mainColor = Color(0xff7CB342);


  static final Color unselectedItemColor = Colors.black.withOpacity(0.3);
  // static final Color unselectedItemColor = ColorHex("#D2CFD6");
  static final Color backgroundScreenColor = ColorHex("#FAF9FE");
  static final Color backgroundPrimaryProfileContainerColor = Colors.grey.withOpacity(0.2);
  static final Color backgroundSecondaryProfileContainerColor = ColorHex("#F85558").withOpacity(0.05);


  static final int  kSpacingUnit = 10;
  static final Color kDarkPrimaryColor = Color(0xFF212121);
  static final Color kDarkSecondaryColor = Color(0xFF373737);
  static final Color kLightPrimaryColor = Color(0xFFFFFFFF);
  static final Color kLightSecondaryColor = Color(0xFFF3F7FB);
  static final Color kAccentColor = Color(0xFFFFC107);
  static final TextStyle kTitleTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUnit * 1.7),
    fontWeight: FontWeight.w600,
  );

  static final kCaptionTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUnit * 1.3),
    fontWeight: FontWeight.w300,
  );

  static final kButtonTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUnit * 1.5),
    fontWeight: FontWeight.w400,
    color: kDarkPrimaryColor,
  );

  static final kLightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'SFProText',
    primaryColor: kLightPrimaryColor,
    canvasColor: kLightPrimaryColor,
    backgroundColor: kLightSecondaryColor,
    accentColor: kAccentColor,
    iconTheme: ThemeData.light().iconTheme.copyWith(
      color: kDarkSecondaryColor,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'SFProText',
      bodyColor: kDarkSecondaryColor,
      displayColor: kDarkSecondaryColor,
    ),
  );

  static var red = ColorHex("#BC0D00");
  static final Color green = ColorHex("#518239");
  static final Color blue = ColorHex("#1441a6");
  static final Color lightblue = ColorHex("#2a8fe4");
  static final Color bluelogo = ColorHex("#04599c");
  static final Color yellow = ColorHex("#F8BA3E");

  static final Map<String, Color> profitTransferStatusColor = {
    "requested": Colors.blueAccent,
    "rejected": Colors.red,
    "approved": Colors.green,
    "completed": Color.fromRGBO(245, 56, 146, 1),
    "canceled": Colors.grey,
  };

  static final Map<String, Color> doctorSessionStatus = {
    "unavailable": Colors.grey,
    "in-session": Colors.red,
    "available": Colors.green,
  };

  //you can used also color without define ColorHex
  //may add 0xFF + hexa code of color like
  static const Color primaryColor = Colors.white;
  static const Color primaryColorDark = Color(0xFF1f5bf7);
  static const Color accentColor = Color(0xFF7b4ee0);
  static const Color accentColorLight = Color(0xFF565656);
  static const Color accentColorDark = Color(0xFF1d1c1c);

  static const Map<int, Color> gradientGreen = const <int, Color>{
    50: const Color(0xFFf2f8ef),
    100: const Color(0xFFdfedd8),
    200: const Color(0xFFc9e2be),
    300: const Color(0xFFb3d6a4),
    400: const Color(0xFFa3cd91),
    500: const Color(0xFF93c47d),
    600: const Color(0xFF8bbe75),
    700: const Color(0xFF80b66a),
    800: const Color(0xFF76af60),
    900: const Color(0xFF64a24d)
  };
}

class ColorHex extends Color {
  ColorHex(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
