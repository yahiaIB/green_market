import 'package:Blwahda/screens/home_screen/widgets/mainButton.dart';
import 'package:Blwahda/utils/preference_utils.dart';
import 'package:Blwahda/view_models/app_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import 'authentication_model.dart';


final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  login() async {
    if (_fbKey.currentState.saveAndValidate()) {
      print(_fbKey.currentState.value);
      bool login = await Provider.of<AuthenticationViewModel>(context, listen: false).signIn(data: _fbKey.currentState.value);
      Provider.of<AppStatusViewModel>(context, listen: false).setStatus(AppStatus.Authenticated);
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context , login);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FormBuilder(
                key: _fbKey,
                initialValue: {
                  'date': DateTime.now(),
                  'accept_terms': false,
                },
                autovalidate: true,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        attribute: "user_name",
                        decoration: InputDecoration(
                          labelText: "Username"
                        ),
                      ),
                      FormBuilderTextField(
                        attribute: "password",
                        obscureText: true,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                    ],
                  ),
                )
            ),
            MainButton(
              textLabel: "Login",
              onPress: () => login(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Provider.of<AuthenticationViewModel>(context, listen: false).skip();
          Provider.of<AppStatusViewModel>(context, listen: false).setStatus(AppStatus.Authenticated);
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => Home()),
//          );
        },
        tooltip: 'Skip',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
