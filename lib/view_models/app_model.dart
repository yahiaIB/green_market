import 'dart:convert';
import 'dart:io';
import 'package:Vio_Telehealth/config/constants.dart';

import '../utils/preference_utils.dart';
import '../web_services/socket.dart';
import '../models/user.dart';
import './base_model.dart';
import '../repositories/user_repository.dart';

class AppViewModel extends BaseViewModel {
  User _user;
  PreferenceUtils preferenceUtils;
  SocketManager _manager = SocketManager.getInstance();
  UserRepository _userRepository = new UserRepository();

  User get user => _user;


  void init() {
    print('init has called');
    initPreferenceUtils();
    var userData = preferenceUtils.getData(PreferenceUtils.UserKey);
    _user = User().fromJson(json.decode(userData));
    _manager.socketInstance.on("profile-change", onUserProfileChanged);
  }

  initPreferenceUtils() {
    preferenceUtils = PreferenceUtils.getInstance();
  }

  void onUserProfileChanged(data) async {
    _user = await _userRepository.profile(
        userId: preferenceUtils.getData(PreferenceUtils.UserId));
    preferenceUtils.saveStringData(PreferenceUtils.UserKey, json.encode(_user));
    notifyListeners();
  }


  Future updateFCMToken({userData}) async {
    try {
      String userId = preferenceUtils.getData(PreferenceUtils.UserId);
      String language = preferenceUtils.getData(Constants.langCodeKey);
      userData['default_language'] = language;
      await _userRepository.serverUpdateUserFCMToken(userData , userId);
      return true;
    } catch (e) {
      return e;
    }
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
