import 'package:Blwahda/utils/preference_utils.dart';
import 'package:flutter/material.dart';


class Authenticate{
  static PreferenceUtils preferenceUtils;

  static authenticate(Function _function , context) async {
    preferenceUtils = PreferenceUtils.getInstance();
    var userRoles = preferenceUtils.getData(PreferenceUtils.UserRoles);

  }
}