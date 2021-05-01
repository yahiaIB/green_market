import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/newPasswordScreen.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/register_greenMarket.dart';
import 'package:Vio_Telehealth/screens/home_screen/home.dart';
import 'package:Vio_Telehealth/screens/home_screen/main_home_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/authentication_screen/login_greenMarket.dart';
import 'package:Vio_Telehealth/screens/profile_screen/Personal_details.dart';
import 'package:Vio_Telehealth/screens/profile_screen/address.dart';
import 'package:Vio_Telehealth/screens/profile_screen/my_orders.dart';
import 'package:Vio_Telehealth/screens/profile_screen/add_address.dart';
import 'package:Vio_Telehealth/screens/profile_screen/editPersonalDetails.dart';
import 'package:Vio_Telehealth/models/address.dart';
import '../screens/authentication_screen/forgetPasswordScreen.dart';
import '../screens/authentication_screen/verificationCodeScreen.dart';

class Routes {
  Routes._();

  //static variables
  static const String initRoute = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String main = '/main';
  static const String register = '/register';
  static const String addresses = '/addresses';
  static const String personalDetails = '/personalDetails';
  static const String myOrders = '/myOrders';
  static const String addAddress = '/addAddress';
  static const String editPersonalDetails = '/editPersonalDetails';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String verificationCodeScreen = '/verificationCodeScreen';
  static const String newPasswordScreen = '/newPasswordScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case main:
        return MaterialPageRoute(builder: (_) => MainHomeScreen());
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case login:
        return MaterialPageRoute(builder: (_) => LoginGreenMarket());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterGreenMarket());
      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case verificationCodeScreen:
        var data = settings.arguments as Map;
        String id = data != null ? data["_id"] : null;
        String token = data != null ? data["token"] : null;
        return MaterialPageRoute(builder: (_) => VerificationCodeScreen(id: id,token: token,));
      case newPasswordScreen:
        var user = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => NewPasswordScreen(user: user,));
      case addresses:
        return MaterialPageRoute(builder: (_) => Addresses());
      case personalDetails:
        return MaterialPageRoute(builder: (_) => PersonalDetails());
      case myOrders:
        return MaterialPageRoute(builder: (_) => MyOrders());
      case editPersonalDetails:
        var personalData = settings.arguments as Map;
        String fullName =
            personalData != null ? personalData["fullName"] : null;
        String mobile = personalData != null ? personalData["mobile"] : null;
        String image = personalData != null ? personalData["image"] : null;
        return MaterialPageRoute(
            builder: (_) => EditPersonalDetails(fullName, mobile,image));
      case addAddress:
        var data = settings.arguments as Map;
        int index = data != null ? data["index"] : null;
        UserAddress addressInfo = data != null ? data["address"] : null;
        return MaterialPageRoute(
            builder: (_) => AddAddress(
                  index: index,
                  addressInfo: addressInfo,
                ));
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
