
import 'package:Vio_Telehealth/screens/authentication_screen/login.dart';
import 'package:Vio_Telehealth/screens/home_screen/home.dart';
import '../../screens/splash_screen/widgets/splash_widget.dart';
import '../../view_models/app_status_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentication_screen/login_greenMarket.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStatusViewModel>(
      builder: (context, authModel, child) {
        AppStatus appStatus = authModel.status;
        Widget screen;
        switch (appStatus) {
          case AppStatus.Authenticated:
            screen = Home();
            break;
          case AppStatus.Unauthenticated:
            screen = LoginGreenMarket();
            break;
          case AppStatus.Uninitialized:
            screen = SplashWidget();
            break;
          default:
            screen = SplashWidget();
        }
        return SafeArea(top: false, child: screen);
      },
    );
  }
}
