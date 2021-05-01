import 'dart:convert';
import 'dart:math';

import 'package:Blwahda/config/auth/roles.dart';
import 'package:Blwahda/helpers/string_translation.dart';
import 'package:Blwahda/screens/authentication_screen/login.dart';
import 'package:Blwahda/screens/authentication_screen/loginScreenWithoutSkip.dart';
import 'package:Blwahda/utils/preference_utils.dart';

import '../../models/user.dart';

import '../../repositories/authentication_repository.dart';
import '../../view_models/base_model.dart';
import 'package:flutter/material.dart';

import 'login_greenMarket.dart';

class AuthenticationViewModel extends BaseViewModel {
  AuthenticationRepository _repository = AuthenticationRepository();

  Future signIn({@required data}) async {
    try {
      setBusy(true);
      var user = await _repository.signIn(data: data);
      setBusy(false);
      return user;
    } catch (err) {
      setBusy(false);
      rethrow;
    }
  }

  Future signUp({@required userData}) async {
//    status = AppStatus.Authenticating;
    try {
      setBusy(true);
      User user = await _repository.serverSignUp(userData);
      setBusy(false);
      return user;
    } catch (e) {
      setBusy(false);
      throw handelError(e);
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

  Future forgetPassword({@required String email}) async {
    try {
      setBusy(true);
      var data = await _repository.serverForgetPassword(email: email);
      setBusy(false);
      return data;
    } catch (err) {
      setBusy(false);
      print(err);
      rethrow;
    }
  }

  Future verify({@required String userId, @required String token}) async {
    try {
      setBusy(true);
      var user = await _repository.verify(token: token, userId: userId);
      setBusy(false);
      return user;
    } catch (err) {
      setBusy(false);
      print(err);
      rethrow;
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
        bool login = await showDialog(
            context: context,
            barrierDismissible: false,
            // user must tap button!
            builder: (BuildContext context) {
              return Container(
                child: new AlertDialog(
                  title: new Text(translate("You have to login first")),
                  actions: <Widget>[
                    new FlatButton(
                      child: Text(translate('Go to login')),
                      onPressed: () async {
                        bool isLoggedIn = await Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new LoginWithoutSkip()
                            )
                        );
                        Navigator.of(context).pop(isLoggedIn);
                      },
                    ),
                    new FlatButton(
                      child: Text(translate('NO')),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ],
                ),
              );
            });
        if (login) {
          _function();
        }
      }
    } catch (e) {}
  }
}
