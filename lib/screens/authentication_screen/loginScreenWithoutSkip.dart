import 'package:Vio_Telehealth/app/app_keys.dart';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/app_status_model.dart';
import 'package:flutter/material.dart';
import 'package:Vio_Telehealth/utils/validators.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';
import 'package:provider/provider.dart';

import 'authentication_model.dart';

class LoginWithoutSkip extends StatefulWidget {
  @override
  _LoginWithoutSkipState createState() => _LoginWithoutSkipState();
}

class _LoginWithoutSkipState extends State<LoginWithoutSkip> {
  final _formkey = GlobalKey<FormState>();
  bool _isHidden = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleVisability() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void login() async {
    AppViewModel appModel = Provider.of<AppViewModel>(context, listen: false);
    AuthenticationViewModel authenticationModel =
        Provider.of<AuthenticationViewModel>(context, listen: false);
    AppStatusViewModel appStatusViewModel =
        Provider.of<AppStatusViewModel>(context, listen: false);

    Map data = {
      "username": emailController.text,
      "password": passwordController.text,
    };
    try {
      User user = await authenticationModel.signIn(data: data);
      appModel.setUser(user);
      appModel.getUserAddresses();
      appStatusViewModel.setStatus(AppStatus.Authenticated);
      Navigator.pop(context, true);
    } catch (e) {
      UtilsFunctions.showSnackBarWithScaffoldKey(
          scaffoldKey: AppKeys.loginScreenScaffoldKey, text: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.loginScreenScaffoldKey,
      //backgroundColor: Color(0xffF5F3F0),
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset("assets/3695813.jpg"),
              Image.asset("assets/3681093.jpg"),
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context).translate("Sign In"),
                          style: TextStyle(
                            fontSize: 35,
                            color: Color(0xff393951),
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          labelText: AppLocalizations.of(context)
                              .translate("Enter Email"),
                          labelStyle: TextStyle(color: Colors.black54),
                          icon: const Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: const Icon(
                              Icons.email,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => UtilsFunctions.validation(
                            value,
                            Validators.isValidEmail(value),
                            AppLocalizations.of(context)
                                .translate("please enter your Email")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        controller: passwordController,
                        decoration: new InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                            labelText: AppLocalizations.of(context)
                                .translate("Enter Password"),
                            labelStyle: TextStyle(color: Colors.black54),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  toggleVisability();
                                },
                                icon: _isHidden
                                    ? Icon(Icons.visibility_off,
                                        color: Colors.black54)
                                    : Icon(Icons.visibility,
                                        color: Colors.black54)),
                            icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(
                                Icons.lock,
                                color: Colors.black54,
                              ),
                            )),
                        obscureText: _isHidden,
                        keyboardType: TextInputType.text,
                        validator: (value) => UtilsFunctions.validation(
                            value,
                            Validators.isValidPassword(value),
                            AppLocalizations.of(context)
                                .translate("Please enter your password")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                                AppLocalizations.of(context)
                                    .translate("Forget Password?"),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                )),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.forgetPasswordScreen);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Consumer<AuthenticationViewModel>(
                        builder: (context, authViewModel, child) =>
                            authViewModel.busy
                                ? Center(
                                    child: CircularProgressIndicator(valueColor:  new AlwaysStoppedAnimation<Color>(CustomColors.mainColor),)
                                  )
                                : Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: CustomColors.buttonColor,
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.fromLTRB(
                                          20.0, 20.0, 20.0, 20.0),
                                      onPressed: () {
                                        if (_formkey.currentState.validate()) {
                                          login();
                                        }
                                      },
                                      child: Text(
                                          AppLocalizations.of(context)
                                              .translate("Sign In"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: GestureDetector(
                          child: Text(
                              AppLocalizations.of(context)
                                  .translate("Don't you have account?"),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              )),
                          onTap: () async {
                            var isLoggedIn = await Navigator.pushNamed(
                                context, Routes.register);
                            if (isLoggedIn != null) {
                              Navigator.of(context).pop(isLoggedIn);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
