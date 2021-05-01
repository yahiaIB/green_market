import 'dart:convert';
import 'package:Blwahda/config/constants.dart';
import 'package:Blwahda/models/order_entity.dart';
import 'package:Blwahda/models/user_orders_entity.dart';
import 'package:Blwahda/screens/authentication_screen/authentication_model.dart';
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
  List<UserOrdersEntity> _orderList = [];

  List<UserOrdersEntity> get orderList => _orderList;

  List<UserAddress> get addressesList => _addressesInfo;

  User get user => _user;

  void init() {
    print('init has called');
    initPreferenceUtils();
    var userData = preferenceUtils.getData(PreferenceUtils.UserKey);
    print(userData);
    if (userData != null) {
      _user = User().fromJson(json.decode(userData));
      getUserAddresses();
    }
    if (_user == null) {
      setGuestUser();
    }
  }

  initPreferenceUtils() {
    preferenceUtils = PreferenceUtils.getInstance();
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

  void setGuestUser() {
    User newUser = User();
    newUser.name = "Guest";
    newUser.password = "1234567r";
    newUser.mobile = "+201156379617";
    newUser.email = "blwa7da@gmail.com";
    _user = newUser;
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

  Future editPersonalDetails(String fullName, String mobile, image) async {
    try{
      setBusy(true);
      var data = {
        "name": fullName,
        "mobile": mobile,
      };
      User updateUser = await _userRepository.updateProfile(userId: _user.sId, userData: data, image: image);
      preferenceUtils.saveStringData(PreferenceUtils.UserKey, json.encode(updateUser.toJson()));
      _user = updateUser;
      setBusy(false);
      notifyListeners();
    }catch(e){
      setBusy(false);
      throw handelError(e);
    }

  }
  Future updatePassword({String userId,String password}) async {
    try{
      setBusy(true);
      var data = {
        "password": password,
      };
      User updateUser = await _userRepository.updatePassword(userId: userId, password: password);
      print("updatePassword");
      print(updateUser.name);
      preferenceUtils.saveStringData(PreferenceUtils.UserKey, json.encode(updateUser.toJson()));
      _user = updateUser;
      setBusy(false);
      notifyListeners();
    }catch(e){
      setBusy(false);
      throw handelError(e);
    }

  }

  Future addAddress(Map address) async {
    try {
      await _userRepository.serverCreateAddress(address, _user.sId);
    } catch (e) {
      throw handelError(e);
    }
  }

  Future getUserAddresses() async {
    try {
      setBusy(true);
      List<UserAddress> result = await _userRepository.serverGetUserAddress(_user.sId);
      _addressesInfo = result;
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      throw handelError(e);
    }
  }


  void deleteAddress(int index, String id) async {
    try {
      setBusy(true);
      var result = await _userRepository.serverDeleteUserAddress(_user.sId, id);
      addressesList.removeAt(index);
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      throw handelError(e);
    }
  }

  void editAddress(int index, UserAddress address) {
    addressesList.removeAt(index);
    addressesList.insert(index, address);
    notifyListeners();
  }

  Future getUserOrders() async{
    try{
      setBusy(true);
      List<UserOrdersEntity> result = await _userRepository.serverGetUserOrder(_user.sId);
      _orderList = result;
      notifyListeners();
      setBusy(false);
    }catch(e){
      setBusy(false);
      throw handelError(e);
    }
  }
}
