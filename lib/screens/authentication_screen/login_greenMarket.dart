import 'package:Vio_Telehealth/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:Vio_Telehealth/utils/validators.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';

class LoginGeenMarket extends StatefulWidget {
  @override
  _LoginGeenMarketState createState() => _LoginGeenMarketState();
}

class _LoginGeenMarketState extends State<LoginGeenMarket> {
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

  void login() {
    Map data = {};
    data["email"] = emailController.text;
    data["password"] = passwordController.text;
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
              //Image.asset("assets/3695813.jpg"),
              Image.asset("assets/3681093.jpg"),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign In",
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
                          labelText: "Enter Email",
                          icon: const Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: const Icon(Icons.email),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => UtilsFunctions.validation(
                            value, Validators.isValidEmail(value)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        controller: passwordController,
                        decoration: new InputDecoration(
                            labelText: "Enter Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  toggleVisability();
                                },
                                icon: _isHidden
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.lock),
                            )),
                        obscureText: _isHidden,
                        keyboardType: TextInputType.text,
                        validator: (value) => UtilsFunctions.validation(
                            value, Validators.isValidPassword(value)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forget Password?",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: CustomColors.buttoncolor,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              login();
                            }
                          },
                          child: Text("Sign In",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: GestureDetector(
                          child: Text("Don't you have account?",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              )),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.register);
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CustomColors.buttoncolor,
        icon: Icon(Icons.arrow_forward),
        onPressed: () {},
        label: Text("Skip"),
      ),
    );
  }
}
