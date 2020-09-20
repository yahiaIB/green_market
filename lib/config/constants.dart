import 'package:flutter/material.dart';

class Constants {
  static const appTitle = "boiler-Plate";

  static final langCodeKey = 'language_code';
  static final enLangCode = 'en';
  static final arLangCode = 'ar';

  static final appThemeKey = 'app_theme';
  static final lightAppTheme = 'light';
  static final darkAppTheme = 'dark';
  static final mainScreenScaffoldKey = GlobalKey<ScaffoldState>();

  static final List<String> doseTypesList = [
    "tablet",
    "capsule",
    "powder",
    "lozenges",
    "mixtures",
    "implant",
    "irrigation-solution",
    "lotion",
    "gargle",
    "drops",
    "ointment",
    "cream",
    "injections",
    "suppository",
    "transdermal-patch",
    "inhaler",
    "pessary",
    "enema",
  ];

  static final List<Map<String, dynamic>> subscriptionModels = [
    {
      "_id": "5edb535303a7ec54be812e18",
      "name": "1 month",
      "interval": {"amount": 1, "key": "months"},
      "cost": 100
    },
    {
      "_id": "5edb53445e5ab5c6e4f8db67",
      "name": "1 year",
      "interval": {"amount": 1, "key": "years"},
      "cost": 1200
    }
  ];
}
