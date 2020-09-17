import 'dart:async';
import 'dart:io';
import 'package:Vio_Telehealth/view_models/app_model.dart';
//import 'package:Vio_Telehealth/view_models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

class FirebaseLocalNotifications {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  FirebaseMessaging _firebaseMessaging;

  void setUpFirebase(BuildContext context) {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = new AndroidInitializationSettings("launcher_icon");
    var iOSInitializationSettings = IOSInitializationSettings();
    var platformInitializtionSpecifics = InitializationSettings(
        initializationSettingsAndroid, iOSInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(platformInitializtionSpecifics, onSelectNotification: null);
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessaging_Listeners(context);
  }

  void firebaseCloudMessaging_Listeners(context) {
    _firebaseMessaging.configure(
        onMessage: (message) async {
          try {
            print(message);
            var title;
            var body;
            var data;
            if (message['notification'] != null) {
              title = message['notification']['title'];
              body = message['notification']['body'];
              data = message['data'];
            } else {
              title = message['aps']['alert']['title'];
              body = message['aps']['alert']['body'];
              data = message['aps']['data'];
            }
            print(data);
            if(data['type'] == "doctor-session-status" || data['type'] == "doctor-invitation") {
//              Provider.of<PatientViewModel>(context,listen: false).getDoctors();
            }
            if(data['isSilent'] != "true"){
              localNotification({
                'notification': {'title': title, 'body': body},
                'data': data
              });
            }
//            doctor-session-status

          } catch (e) {
            print(e);
          }
        },
        onBackgroundMessage: null,
        onLaunch: (message) async {
          print('onLaunch: $message');
        },
        onResume: (message) async {
          print('onResume: $message');
        });
    _firebaseMessaging.getToken().then((token) {
      print('user token:' + token);
      AppViewModel userViewModel = Provider.of<AppViewModel>(context,listen: false);
      userViewModel.updateFCMToken(userData: {'fcm_token': token}).then((response){
        print(response);
        print('updated fcm token');
      });
      // put request
      //fcm_token
    });
  }

  void localNotification(message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'VIO Clinic',
      'users',
      'description',
      icon: 'launcher_icon',
      importance: Importance.Max,
      priority: Priority.High,
      enableLights: true,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    try {
      await flutterLocalNotificationsPlugin.show(
          0,
          message['notification']['title'],
          message['notification']['body'],
          platformChannelSpecifics,
          payload: jsonEncode(message['data']));
    } catch (e) {
      print(e);
    }
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {}

  FutureOr onValue(bool value) {}
}
