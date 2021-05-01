import 'package:Blwahda/view_models/app_lang.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {

  final Function onPress;

  CustomBackButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    AppLanguage appLang = AppLanguage();
    print(appLang.appLocal.languageCode );
    return Align(
      alignment: appLang.appLocal.languageCode == "ar" ?  Alignment.topRight: Alignment.topLeft ,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: IconButton(
          onPressed: onPress,
          icon: Icon(Icons.arrow_back),
          iconSize: 25,
        ),
      ),
    );
  }
}
