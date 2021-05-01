import 'dart:convert';
import 'dart:io';

import 'package:Blwahda/models/order_entity.dart';
import 'package:Blwahda/models/user_orders_entity.dart';
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
  Future<User> updatePassword({String userId,String password}) async {

    final response = await HttpClient.getInstance().put(EndPoints.updateUserEndpoint(userId),data: {"password":password});
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

  Future<List <OrderEntity> > fetchOrders({String userId}) async {
    final response = await HttpClient.getInstance().get(EndPoints.ordersEndpoint(userId));
    List <OrderEntity> orders = response.data.map<OrderEntity>((order)=>OrderEntity().fromJson(order)).toList();
    return orders;
  }
  Future serverCreateOrder(order) async {
    try {
      var response = await HttpClient.getInstance().post(EndPoints.createOrdersEndpoint, data: order);
      return response.data;
    } catch (e) {
      throw e;
    }
  }
  Future<List<UserOrdersEntity>> serverGetUserOrder(userId) async {
    try {
      var response = await HttpClient.getInstance().get(EndPoints.ordersEndpoint(userId),queryParameters: {"sort":"-created_at"});
      return response.data.map<UserOrdersEntity>((order)=> UserOrdersEntity().fromJson(order)).toList();
    } catch (e) {
      throw e;
    }
  }


  Future serverDeleteUserOrder(userId, addressId) async {
    try {
      var response = await HttpClient.getInstance().delete(EndPoints.deleteUserOrderEndpoint(userId,addressId));
      return response.data;
    } catch (e) {
      throw e;
    }
  }





}
