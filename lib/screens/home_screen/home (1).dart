import 'package:Vio_Telehealth/config/auth/auth_visibility_widget.dart';
import 'package:Vio_Telehealth/config/auth/authorization.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/authentication_model.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/login.dart';
import 'package:Vio_Telehealth/screens/home_screen/widgets/mainButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

bool isLoggedIn = true;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  showToast(){
    Toast.show("Action button B", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM,backgroundColor: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MainButton(onPress: (){
              Toast.show("Action button A", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM,backgroundColor: Colors.green);
            },textLabel: "A",),
             MainButton(onPress: () => Provider.of<AuthenticationViewModel>(context, listen: false).authenticate(showToast , context) ,textLabel: "B",),
            AuthVisibilityWidget(
              child: MainButton(onPress: (){
                Toast.show("Action button C Admin only", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM,backgroundColor: Colors.pinkAccent);
              },textLabel: "C",),
              resourceName: Authorizations.buttonC,
            ),

          ],
        ),
      ),
    );
  }
}
