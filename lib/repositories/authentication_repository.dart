import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:Vio_Telehealth/models/user.dart';
import 'package:dio/dio.dart';

import '../utils/preference_utils.dart';
import '../web_services/endpoints.dart';
import '../web_services/http_client.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  var role = 'patient';

  Future SignIn({String mobile}) async {
    final data = {
      'mobile': mobile,
      'roles': [role]
    };
    final response = await HttpClient.getInstance().post(EndPoints.loginEndpoint, data: data);
    return response.data;
  }

  Future<User> verify({String userId, String token}) async {
    final data = {'id': userId, 'token': token};
    final response = await HttpClient.getInstance().post(EndPoints.verifyEndpoint, data: data);
    User user = User().fromJson(response.data);
    return user;
  }

  Future<User> serverSignUp(userData) async {
    try {
      print("sign up");
      var data = FormData.fromMap({
        "data": jsonEncode(userData),
      });
      var response = await HttpClient.getInstance().post('/auth/local/register', data: data,);
      print(response.data);
      User user = User().fromJson(response.data["user"]);
      var prefs = await PreferenceUtils.getInstance();
      prefs.saveStringData(PreferenceUtils.UserId, user.sId);
      prefs.saveStringData(PreferenceUtils.UserKey, json.encode(response.data["user"]));
      prefs.saveStringData(PreferenceUtils.UserToken, response.data["token"]);
      prefs.saveStringData(PreferenceUtils.UserRoles, user.roles[0]);
      return user;
    } catch (e) {
      throw e;
    }
  }



}
