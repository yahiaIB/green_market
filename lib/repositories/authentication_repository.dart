import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:Blwahda/models/user.dart';
import 'package:Blwahda/web_services/error_helper.dart';
import 'package:dio/dio.dart';
import '../utils/preference_utils.dart';
import '../web_services/endpoints.dart';
import '../web_services/http_client.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  var role = 'patient';

  Future signIn({data}) async {
    try{
      final response = await HttpClient.getInstance().post(EndPoints.loginEndpoint, data: data);
      return await serverSaveUser(response.data);
    }catch(e){
      throw ExceptionHelper.parse(err: e);
    }
  }

  Future serverForgetPassword({String email}) async {
    try{
      final data = {'email': email};
      final response = await HttpClient.getInstance().post(EndPoints.forgetPasswordEndpoint, data: data);
      return response.data;
    }catch(e){
      throw ExceptionHelper.parse(err: e);
    }
  }

  Future<User> verify({String userId, String token}) async {
    try{
      final data = {'id': userId, 'token': token};
      final response = await HttpClient.getInstance().post(EndPoints.verifyEndpoint, data: data);
      return await serverSaveUser(response.data);
    }catch(e){
      throw ExceptionHelper.parse(err: e);
    }
  }

  // Future<User> verify({String userId, String token}) async {
  //   try{
  //     final data = {'id': userId, 'token': token};
  //     final response = await HttpClient.getInstance().post(EndPoints.verifyEndpoint, data: data);
  //     return await serverSaveUser(response.data);
  //   }catch(e){
  //     throw ExceptionHelper.parse(err: e);
  //   }
  // }
  Future<User> serverSignUp(userData) async {
    try {
      print("sign up");
      var data = FormData.fromMap({
        "data": jsonEncode(userData),
      });
      var response = await HttpClient.getInstance().post(EndPoints.registerEndpoint, data: data,);
      return await serverSaveUser(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<User> serverSaveUser(data) async {
    User user = User().fromJson(data["user"]);
    var prefs = await PreferenceUtils.getInstance();
    prefs.saveStringData(PreferenceUtils.UserId, user.sId);
    prefs.saveStringData(PreferenceUtils.UserKey, json.encode(data["user"]));
    prefs.saveStringData(PreferenceUtils.UserToken, data["token"]);
    prefs.saveStringData(PreferenceUtils.UserRoles, user.roles[0]);
    return user;
  }
  serverSaveUserToken(String token) {
    var prefs = PreferenceUtils.getInstance();
    prefs.saveStringData(PreferenceUtils.UserToken, token);
  }



}
