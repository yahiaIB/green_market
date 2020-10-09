import 'package:Vio_Telehealth/screens/authentication_screen/register_greenMarket.dart';
import 'package:Vio_Telehealth/screens/home_screen/main_home_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/authentication_screen/login_greenMarket.dart';

class Routes {
  Routes._();

  //static variables
  static const String initRoute = '/';
  static const String login = '/login';
  static const String main = '/main';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => MainHomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginGeenMarket());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterGreenMarket());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static final routes = <String, WidgetBuilder>{
    initRoute: (BuildContext context) => SplashScreen(),
  };
}
