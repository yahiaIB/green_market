import 'dart:convert';
import 'dart:math';

import 'package:Vio_Telehealth/config/auth/roles.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/login.dart';
import 'package:Vio_Telehealth/utils/preference_utils.dart';

import '../../models/user.dart';

import '../../repositories/authentication_repository.dart';
import '../../view_models/base_model.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel extends BaseViewModel {
  AuthenticationRepository _repository = AuthenticationRepository();

  Future signIn({@required data}) async {
    try {
//      var userId = await _repository.SignIn(mobile: mobile);
      var pref = PreferenceUtils.getInstance();
      pref.saveStringData(PreferenceUtils.UserRoles, data['user_name']);
      return true;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future signUp({@required userData}) async {
//    status = AppStatus.Authenticating;
    setBusy(true);
    try {
      User user = await _repository.serverSignUp(userData);
      setBusy(false);
      return user;
    } catch (e) {
      setBusy(false);
      throw handelErrorMessage(e);
    }
  }

  Future skip() async {
    try {
//      var userId = await _repository.SignIn(mobile: mobile);
      var pref = PreferenceUtils.getInstance();
      pref.saveStringData(PreferenceUtils.UserRoles, "guest");
      return true;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<User> verify({@required String userId, @required String token}) async {
    setBusy(true);
    try {
      User user = await _repository.verify(token: token, userId: userId);
      setBusy(false);
      return user;
    } catch (err) {
      setBusy(false);
      print(err);
      throw err;
    }
  }

  void logOut() async {
    var pref = await PreferenceUtils.getInstance();
    pref.removeWithKey(PreferenceUtils.UserKey);
    pref.removeWithKey(PreferenceUtils.UserToken);
    pref.removeWithKey(PreferenceUtils.UserId);
    pref.removeWithKey(PreferenceUtils.UserRoles);
    pref.clearAll();
  }

  void saveUser(User user) {
    var pref = PreferenceUtils.getInstance();
    pref.saveStringData(PreferenceUtils.UserKey, json.encode(user.toJson()));
    // pref.saveStringData(PreferenceUtils.UserToken, user.token);
    pref.saveStringData(PreferenceUtils.UserId, user.sId);
    pref.saveStringData(PreferenceUtils.UserRoles, user.roles[0]);
  }

  authenticate(Function _function, context) async {
    try {
      var pref = PreferenceUtils.getInstance();
      var userRoles = pref.getData(PreferenceUtils.UserRoles);
      if (userRoles != null && userRoles != Roles.guest) {
        _function();
      } else {
       bool login =  await showDialog(context: context, barrierDismissible: false, // user must tap button!
           builder: (BuildContext context) {
             return Container(
               child: new AlertDialog(
                 title: new Text("You have to login first"),
                 actions: <Widget>[
                   new FlatButton(
                     child: const Text('Go to login'),
                     onPressed: () async {
                      bool isLogined = await Navigator.push(
                          context, new MaterialPageRoute(
                               builder: (BuildContext context) => new Login()
                              )
                      );
                       Navigator.of(context).pop(isLogined);
                     },
                   ),
                   new FlatButton(
                     child: const Text('NO'),
                     onPressed: () {
                       Navigator.of(context).pop(false);
                     },
                   ),
                 ],
               ),
             );
           });
       if(login){
         _function();
       }
      }
    } catch (e) {}
  }

}
