import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../web_services/endpoints.dart';

import '../web_services/http_client.dart';
import '../models/user.dart';
import 'package:intl/intl.dart';

class UserRepository {

  Future<User> updateProfile({String userId , userData , image}) async {
    var data = FormData.fromMap({
      "data": jsonEncode(userData),
    });
    if (image != null && image.runtimeType != String) {
      data.files.add(MapEntry(
          "image",
          MultipartFile.fromFileSync(image.path,
              filename: image.path)));
    }
    final response = await HttpClient.getInstance().put(EndPoints.updateUserEndpoint(userId),data: data);
    User user = User().fromJson(response.data);
    return user;
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


  Future serverCreateAddress(address,userId) async {
    try {
      var response = await HttpClient.getInstance().post(EndPoints.addressesEndpoint(userId), data: address);
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<UserAddress>> serverGetUserAddress(userId) async {
    try {
      var response = await HttpClient.getInstance().get(EndPoints.addressesEndpoint(userId));
      return response.data.map<UserAddress>((address)=> UserAddress().fromJson(address)).toList();
    } catch (e) {
      throw e;
    }
  }

  Future serverDeleteUserAddress(userId, addressId) async {
    try {
      var response = await HttpClient.getInstance().delete(EndPoints.deleteUserAddressEndpoint(userId,addressId));
      return response.data;
    } catch (e) {
      throw e;
    }
  }



}
