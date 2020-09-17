import 'dart:async';
import 'dart:convert';

import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/repositories/user_repository.dart';

import '../utils/preference_utils.dart';

import '../view_models/base_model.dart';

enum AppStatus {
  Uninitialized,
  Authenticated,
  Unauthenticated,
  OnBoarding,
  PinCoded,
}

class AppStatusViewModel extends BaseViewModel {
  AppStatus _status = AppStatus.Uninitialized;
  PreferenceUtils preferenceUtils;
  UserRepository _repository = UserRepository();

  AppStatus get status => _status;

  void setStatus(AppStatus status) {
    this._status = status;
    notifyListeners();
  }

  void init() async {
    preferenceUtils = PreferenceUtils.getInstance();
    String userId = preferenceUtils.getData(PreferenceUtils.UserId);
    if (userId != null) {
      User user = await _repository.profile(userId: userId);
      preferenceUtils.saveStringData(PreferenceUtils.UserKey, json.encode(user.toJson()));
      setStatus(AppStatus.Authenticated);
    } else {
      Timer(Duration(seconds: 3), () => setStatus(AppStatus.Unauthenticated));
    }
  }
}
