import 'dart:convert';
import 'dart:io';

import 'package:Vio_Telehealth/models/order_entity.dart';
import 'package:Vio_Telehealth/models/user_orders_entity.dart';
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
      var response = await HttpClient.getInstance().get(EndPoints.ordersEndpoint(userId));
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
