import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:Vio_Telehealth/utils/validators.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';

class RegisterGreenMarket extends StatefulWidget {
  @override
  _RegisterGreenMarketState createState() => _RegisterGreenMarketState();
}

class _RegisterGreenMarketState extends State<RegisterGreenMarket> {
  final _formkey = GlobalKey<FormState>();
  bool _isHidden = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void toggleVisability() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void register() {
    Map data = {};
    data["email"] = emailController.text;
    data["password"] = passwordController.text;
    data["fullName"] = fullNameController.text;
    data["phoneNumber"] = phoneNumberController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffF5F3F0),
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/3681093.jpg"),
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context).translate("Sign Up"),
                          style: TextStyle(
                            fontSize: 35,
                            color: Color(0xff393951),
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          labelText: AppLocalizations.of(context)
                              .translate("Full Name"),
                          labelStyle: TextStyle(color: Colors.black54),
                          icon: const Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: const Icon(
                              Icons.person,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) => UtilsFunctions.validation(
                            value,
                            Validators.isValidUserName(value),
                            AppLocalizations.of(context)
                                .translate("please enter your name")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          labelText: AppLocalizations.of(context)
                              .translate("Enter Mobile Number"),
                          labelStyle: TextStyle(color: Colors.black54),
                          icon: const Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: const Icon(
                              Icons.phone,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) => UtilsFunctions.validation(
                            value,
                            Validators.isValidMobile(value),
                            AppLocalizations.of(context)
                                .translate("please enter your mobile number")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
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
                        height: 10,
                      ),
                      new TextFormField(
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
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black54,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.black54,
                                      )),
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
                                .translate("please enter your password")),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: CustomColors.buttonColor,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              register();
                            }
                          },
                          child: Text(
                              AppLocalizations.of(context).translate("Sign Up"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: GestureDetector(
                          child: Text(
                              AppLocalizations.of(context)
                                  .translate("Do you have account?"),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              )),
                          onTap: () {
                            Navigator.pop(context);
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