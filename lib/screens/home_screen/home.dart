import 'dart:convert';

import 'package:Blwahda/app/routes.dart';
import 'package:Blwahda/helpers/app_localizations.dart';
import 'package:Blwahda/screens/cart_screen/cart_screen.dart';
import 'package:Blwahda/screens/products_screen/products_screen.dart';
import 'package:Blwahda/screens/profile_screen/profile_screen.dart';
import 'package:Blwahda/theme/custom_colors.dart';
import 'package:Blwahda/view_models/app_model.dart';
import 'package:Blwahda/view_models/cart_view_model.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin , FCMNotificationMixin, FCMNotificationClickMixin {
  RemoteMessage _notification;
  final String serverToken = 'your key here';
  int _selectedIndex = 0;

  List<Widget> _widgetOptions=[
    Products(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    updateFcmToken();
//    FirebaseLocalNotifications().setUpFirebase(context);
    super.initState();
  }

  updateFcmToken() async {
    AppViewModel userViewModel = Provider.of<AppViewModel>(context, listen: false);
    userViewModel.updateFCMToken(userData: {'fcm_token':  await FCMConfig.getToken()}).then((response) {
      print(response);
      print('updated fcm token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: Consumer<CartViewModel>(
        builder: (BuildContext context, CartViewModel cartVM, Widget child) =>  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(AppLocalizations.of(context).translate("Home")),
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    alignment: Alignment.center,
                      children: [
                        Icon(Icons.shopping_basket,),
                        cartVM.cartItems.isNotEmpty ?
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: CustomColors.buttonColor,
                          ),
                        )
                        :Container(),
                      ]),
                  title: Text(AppLocalizations.of(context).translate("Cart")),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text(AppLocalizations.of(context).translate("Profile")),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: CustomColors.mainColor,
              unselectedItemColor: CustomColors.unselectedItemColor,
              selectedIconTheme: IconThemeData(size: 30),
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
  void send() async {
    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'this is a body',
            'title': 'this is a title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'id': '1',
            'status': 'done',
          },
          'to': await FirebaseMessaging.instance.getToken(),
        },
      ),
    );
  }

  @override
  void onNotify(RemoteMessage notification) {
    setState(() {
      _notification = notification;
    });
  }

  @override
  void onClick(RemoteMessage notification) {
    setState(() {
      _notification = notification;
    });
    print("Notification clicked with title: ${notification.notification.title} && body: ${notification.notification.body}");
    Navigator.pushNamed(context, Routes.myOrders);
  }
}
