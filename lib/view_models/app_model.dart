import 'dart:convert';
import 'package:Vio_Telehealth/config/constants.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/authentication_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../utils/preference_utils.dart';
import '../web_services/socket.dart';
import '../models/user.dart';
import './base_model.dart';
import '../repositories/user_repository.dart';
import '../models/address.dart';
import 'app_status_model.dart';

class AppViewModel extends BaseViewModel {
  User _user;
  PreferenceUtils preferenceUtils;
  SocketManager _manager = SocketManager.getInstance();
  UserRepository _userRepository = new UserRepository();
  List<UserAddress> _addressesInfo = [];
  List<UserAddress> get addressesList => _addressesInfo;
  User get user => _user;

  void init() {
    print('init has called');
    initPreferenceUtils();
    var userData = preferenceUtils.getData(PreferenceUtils.UserKey);
    print(userData);
    if (userData != null) {
      _user = User().fromJson(json.decode(userData));
    }
    if (_user == null) {
      User newUser = User();
      newUser.name = "Montaser helmy";
      newUser.password = "123456789";
      newUser.mobile=  "+201156379617";
      newUser.email=  "montaserhelmy@gmail.com";

      _user = newUser;
      // _user = User(
      //     fullName: "Montaser helmy",
      //     mobile: "01156379617",
      //     email: "montaserhelmy@gmail.com"
      //     );
    }
    // _manager.socketInstance.on("profile-change", onUserProfileChanged);
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
      await _userRepository.serverUpdateUserFCMToken(userData, userId);
      return true;
    } catch (e) {
      return e;
    }
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  register(Map userData) {
    if (_user == null) {
      _user.name = userData["fullName"];
      _user.mobile = userData["phoneNumber"];
      _user.email = userData["email"];
      _user.password = userData["password"];

      // _user = User(
      //     name: userData["fullName"],
      //     mobile: userData["phoneNumber"],
      //     email: userData["email"],
      //     password: userData["password"],
      //     sId: "123");

      notifyListeners();
      return _user;
    }
  }

  login(Map userData) {
    if (_user == null) {
      _user.name = userData["fullName"];
      _user.mobile = userData["phoneNumber"];
      _user.email = userData["email"];
      _user.password = userData["password"];

      // _user = User(
      //     fullName: "Montaser helmy",
      //     mobile: "01156379617",
      //     email: userData["email"],
      //     password: userData["password"],
      //     sId: "123");
      notifyListeners();
      return _user;
    }
  }

  void editPersonalDetails(String fullName, String mobile) {
    if (_user == null) {
      // _user = User(fullName: fullName, mobile: mobile);
    } else {
      _user.name = fullName;
      _user.mobile = mobile;
    }
    notifyListeners();
  }

  void addAddress(UserAddress address) {
    addressesList.add(address);
    notifyListeners();
  }

  void deleteAddress(int index) {
    addressesList.removeAt(index);
    notifyListeners();
  }

  void editAddress(int index, UserAddress address) {
    addressesList.removeAt(index);
    addressesList.insert(index, address);
    notifyListeners();
  }

}
