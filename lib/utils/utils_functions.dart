import 'dart:math';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UtilsFunctions {
  static validation(value, bool valid, String message) {
    if (value.isEmpty) {
      return message;
    } else {
      if (valid == true) {
        return null;
      } else {
        return "wrong data";
      }
    }
  }

  static showSnackBar(
      {String text, Color color = Colors.red, @required BuildContext context}) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
          backgroundColor: color,
        ),
      );
  }

//  void launchCall(String number) async {
//    var url = number;
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not place the Phone call';
//    }
//  }

  String twoDigits(int n) {
    if (n >= 10) return "${n}";
    return "0${n}";
  }

  int toTwelveHour(int n) {
    return n > 12 ? n % 12 : (n == 0 ? 12 : n);
  }

  String amOrPm(int n) {
    return n >= 12 ? 'p.m.' : 'a.m.';
  }

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'Devember'
  ];

  String computeHowLongAgoText(DateTime timestamp) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just Now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 6) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else {
      bool sameDay = new DateTime(now.year, now.month, now.day) ==
          new DateTime(timestamp.year, timestamp.month, timestamp.day);

      String onText =
          sameDay ? 'Today' : 'on ${months[timestamp.month]} ${timestamp.day}';
      return 'At ${toTwelveHour(timestamp.hour)}:${twoDigits(timestamp.minute)} ${amOrPm(timestamp.hour)} ${onText}';
    }
  }

  String computeHowLongAgoTextShort(DateTime timestamp) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just Now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 6) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else {
      bool sameDay = new DateTime(now.year, now.month, now.day) ==
          new DateTime(timestamp.year, timestamp.month, timestamp.day);

      String onText =
          sameDay ? 'Today' : 'On ${months[timestamp.month]} ${timestamp.day}';
      return '${onText}';
    }
  }

  static changeScreen(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static changeScreenReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static int generateRandomNumber(int max) {
    var rng = new Random();
    return rng.nextInt(max);
  }

//  static void openBrowser(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }

//  static openMap(double latitude, double longitude) async {
//    // You may check this:
//    // var googleUrl = 'geo:$latitude,$longitude';
//    // var googleUrl = 'google.navigation:q=$latitude,$longitude';
//    var googleUrl =
//        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//
//    if (await canLaunch(googleUrl)) {
//      await launch(googleUrl);
//    } else {
//      throw 'Could not open the map.';
//    }
//  }

  static formatDate(String date) {
    if (date != null) {
      DateTime stringToDateTime = DateTime.parse(date);
      return DateFormat.yMMMMd().add_jm().format(stringToDateTime.toLocal());
    } else {
      return "---";
    }
  }

  String replaceText(String data) {
    if (data != null) {
      var x = data.replaceAll(",", "");
      var y = x.replaceAll(".", "");
      return y;
    } else {
      return "";
    }
  }
}
