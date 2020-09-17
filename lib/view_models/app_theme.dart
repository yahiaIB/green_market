import 'dart:math';

import '../theme/custom_theme.dart';
import '../config/constants.dart';
import '../utils/preference_utils.dart';
import 'package:flutter/material.dart';

import 'base_model.dart';

class AppTheme extends BaseViewModel {
  ThemeData _themeData;
  bool _isLight = true;

  ThemeData get appTheme => _themeData ?? CustomTheme.lightTheme;

  ThemeData get isLight => isLight ?? true;

  fetchTheme() async {
    var prefs = PreferenceUtils.getInstance();
    final data = prefs.getData(Constants.appThemeKey);

    if (data == null) {
      _themeData = CustomTheme.lightTheme;
    } else
      _themeData = getTheme(data);

    notifyListeners();
  }

  ThemeData getTheme(String appTheme) {
    if (appTheme == Constants.lightAppTheme) {
      _isLight = true;
      return CustomTheme.lightTheme;
    } else {
      _isLight = false;
      return CustomTheme.darkTheme;
    }
  }

  void changeTheme({@required bool isLight}) async {
    var prefs = PreferenceUtils.getInstance();

    if (_isLight == isLight) return;

    if (isLight) {
      _isLight = true;
      _themeData = CustomTheme.lightTheme;
      await prefs.saveStringData(
          Constants.appThemeKey, Constants.lightAppTheme);
    } else {
      _isLight = false;
      _themeData = CustomTheme.darkTheme;
      await prefs.saveStringData(Constants.appThemeKey, Constants.darkAppTheme);
    }
    notifyListeners();
  }
}
