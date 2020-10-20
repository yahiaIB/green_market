import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../web_services/endpoints.dart';

import '../web_services/http_client.dart';
import '../models/user.dart';
import 'package:intl/intl.dart';

class UserRepository {
  Future<User> profile({String userId}) async {
//    final response = await HttpClient.getInstance().get(EndPoints.profile(userId));
//    User user = User().fromJson(response.data);
//    return user;
  }

  Future<void> serverUpdateUserFCMToken(userData,userId) async {
    try {
      var data = FormData.fromMap({
        "data": jsonEncode(userData),
      });
//      var response = await HttpClient.getInstance().put(EndPoints.updateUserProfile(userId), data: data);
      return true;
    } catch (e) {
      throw e;
    }
  }
}
