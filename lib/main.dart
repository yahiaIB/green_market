import 'package:fcm_config/fcm_config.dart';

import './utils/preference_utils.dart';
import 'package:flutter/material.dart';
import './app/app.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {

  FCMConfig.init(
      onBackgroundMessage: _firebaseMessagingBackgroundHandler,
      androidChannelName: "",
      androidChannelId: "",
      androidChannelDescription: "",
      appAndroidIcon: "launcher_icon")
      .then((value) {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
  });

  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();

  runApp(App());
}
