import './utils/preference_utils.dart';
import 'package:flutter/material.dart';
import './app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();

  runApp(App());
}
