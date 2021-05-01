import 'package:Vio_Telehealth/app/app_keys.dart';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/helpers/string_translation.dart';
import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/authentication_model.dart';
import 'package:Vio_Telehealth/screens/profile_screen/constants/profile_constants.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/app_status_model.dart';
import 'package:flutter/material.dart';
import 'package:Vio_Telehealth/utils/validators.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';
import 'package:provider/provider.dart';

class NewPasswordScreen extends StatefulWidget {
  User user;
  NewPasswordScreen({this.user});
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formkey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    passwordController.dispose();
    super.dispose();
  }

  void updatePassword() async {
    AppViewModel appModel = Provider.of<AppViewModel>(context, listen: false);
    try{
      await appModel.updatePassword(userId: widget.user.sId,password: passwordController.text);
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    }catch(e){
      UtilsFunctions.showSnackBarWithScaffoldKey(scaffoldKey: AppKeys.newPasswordScreenScaffoldKey,text: e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.newPasswordScreenScaffoldKey,
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        shadowColor: CustomColors.mainColor.withOpacity(0.3),
        title: Text(
          translate("New Password"),
          style: TextStyle(
            color: CustomColors.mainColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(translate("Enter your new password"),
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff393951),
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        labelText: translate("Enter your new password"),
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
                          Validators.isValidPassword(value),
                          AppLocalizations.of(context).translate("please enter your new password")),
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
                            updatePassword();
                          }
                        },
                        child: Text(
                            translate("Save"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
