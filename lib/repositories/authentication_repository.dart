import 'dart:convert';
import 'dart:math';

import '../utils/preference_utils.dart';

import '../models/user.dart';

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
    final response = await HttpClient.getInstance()
        .post(EndPoints.verifyEndpoint, data: data);
    User user = User().fromJson(response.data);
    return user;
  }

}
