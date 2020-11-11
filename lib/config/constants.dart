import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/view_models/category_view_model.dart';
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
 //
 //
 //  static List tomatoOptions = [
 //    {"name": "tomato","price":10.0,"unit": "KG" ,"unitChange": 0.25},
 //    {"name": "tomato juice","price":15.0,"unit": "Litre" ,"unitChange": 0.25},
 //    {"name": "tomato Pieces","price":12.0,"unit": "KG" ,"unitChange": 0.25},
 //  ];
 //
 //  static List bananaOptions = [
 //    {"name": "banana","price":10.0,"unit": "KG" ,"unitChange": 0.25},
 //    {"name": "banana juice","price":15.0,"unit": "Litre" ,"unitChange": 0.25},
 //    {"name": "banana Pieces","price":12.0,"unit": "KG" ,"unitChange": 0.25},
 //  ];
 //
 //  static List cucumberOptions = [
 //    {"name": "cucumber","price":10.0,"unit": "KG" ,"unitChange": 0.25},
 //    {"name": "cucumber juice","price":15.0,"unit": "Litre" ,"unitChange": 0.25},
 //    {"name": "cucumber Pieces","price":12.0,"unit": "KG" ,"unitChange": 0.25},
 //  ];
 //  static List orangeOptions = [
 //    {"name": "orange","price":10.0,"unit": "KG" ,"unitChange": 0.25},
 //    {"name": "orange juice","price":15.0,"unit": "Litre" ,"unitChange": 0.25},
 //    {"name": "orange Pieces","price":12.0,"unit": "KG" ,"unitChange": 0.25},
 //  ];
 //  static List potatoOptions = [
 //    {"name": "potato","price":10.0,"unit": "KG" ,"unitChange": 0.25},
 //    {"name": "potato juice","price":15.0,"unit": "Litre" ,"unitChange": 0.25},
 //    {"name": "potato Pieces","price":12.0,"unit": "KG" ,"unitChange": 0.25},
 //  ];
 //
 // static List<Item> items() => [
 //    new Item.fromJson({
 //      'image': "res/assets/images/tomato.png",
 //      'amount': 1.0,
 //      'category_name': "Vegetables",
 //      'options': tomatoOptions
 //    }),
 //    new Item.fromJson({
 //      'image': "res/assets/images/banana.png",
 //      'amount': 1.0,
 //      'category_name': "Fruits",
 //      'options': bananaOptions
 //    }),
 //   new Item.fromJson({
 //      'image': "res/assets/images/cucumber.png",
 //      'amount': 1.0,
 //     'category_name': "Vegetables",
 //      'options': cucumberOptions
 //    }),
 //   new Item.fromJson({
 //      'image': "res/assets/images/orange.png",
 //      'amount': 1.0,
 //     'category_name': "Fruits",
 //      'options': orangeOptions
 //    }),
 //   new Item.fromJson({
 //      'image': "res/assets/images/potato.png",
 //      'amount': 1.0,
 //     'category_name': "Vegetables",
 //      'options': potatoOptions
 //    }),
 //
 //  ];

 static String emptyCartImage() => "res/assets/images/empty_cart.png";
}
