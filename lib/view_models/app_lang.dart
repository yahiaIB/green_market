import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../utils/preference_utils.dart';
import '../view_models/base_model.dart';
import 'package:devicelocale/devicelocale.dart';

class AppLanguage extends BaseViewModel {

  AppLanguage(){
    fetchLocale();
  }
  Locale _appLocale = Locale(Constants.enLangCode);

  Locale get appLocal => _appLocale ?? Locale(Constants.enLangCode);

  fetchLocale() async {
    final data = PreferenceUtils.getInstance().getData(Constants.langCodeKey);
    if (data == null) {
      String locale = await Devicelocale.currentLocale;
      var language = locale.split('_');
      if(language[0] == 'ar' || language[0] == 'en'){
        _appLocale = Locale(language[0]);
      }else{
        _appLocale = Locale(Constants.enLangCode);
      }
    } else
      _appLocale = Locale(data);

    notifyListeners();
  }

  void changeLanguage(String localCode) async {
    var prefs = PreferenceUtils.getInstance();
    if (_appLocale.toString() == localCode) return;
    if (localCode == Constants.arLangCode) {
      await prefs.saveStringData(Constants.langCodeKey, Constants.arLangCode);
    } else {
      await prefs.saveStringData(Constants.langCodeKey, Constants.enLangCode);
    }

    _appLocale = Locale(localCode);

    notifyListeners();
  }
}
