import 'package:Vio_Telehealth/app/app_keys.dart';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/helpers/string_translation.dart';
import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/authentication_model.dart';
import 'package:Vio_Telehealth/screens/profile_screen/constants/profile_constants.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';
import 'package:Vio_Telehealth/utils/validators.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/app_status_model.dart';
import 'package:flutter/material.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerificationCodeScreen extends StatefulWidget {
  String id,token;
  VerificationCodeScreen({this.id,this.token});
  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final _formkey = GlobalKey<FormState>();

  final codeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    codeController.dispose();
    super.dispose();
  }

  Future<User> verify() async{
    print("verify token");
    print(codeController.text);
    print("widget.token");
    print(widget.token);

    AppViewModel appModel = Provider.of<AppViewModel>(context, listen: false);
    AuthenticationViewModel authenticationModel = Provider.of<AuthenticationViewModel>(context, listen: false);
    AppStatusViewModel appStatusViewModel = Provider.of<AppStatusViewModel>(context, listen: false);
    try{
      User user = await authenticationModel.verify(userId: widget.id,token: codeController.text);
      print("verify screen");
      print(user.name);
      appModel.setUser(user);
      appModel.getUserAddresses();
      appStatusViewModel.setStatus(AppStatus.Authenticated);
      return user;
    }catch(e){
      UtilsFunctions.showSnackBarWithScaffoldKey(scaffoldKey: AppKeys.verificationCodeScreenScaffoldKey, text: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.verificationCodeScreenScaffoldKey,
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        shadowColor: CustomColors.mainColor.withOpacity(0.3),
        title: Text(
          translate("Verification Code"),
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
                    Text(
                        translate("Enter verification code"),
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff393951),
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      backgroundColor: CustomColors.background,
                      controller: codeController,
                      validator: (value) => UtilsFunctions.validation(
                          value,
                          Validators.isValidVerificationCode(pinCode: value,number: 4),
                          AppLocalizations.of(context).translate("Please enter your verification code")),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Consumer<AuthenticationViewModel>(
                      builder:(context,authViewModel,child)=> authViewModel.busy ?
                      Center(child: CircularProgressIndicator(valueColor:  new AlwaysStoppedAnimation<Color>(CustomColors.mainColor),),)
                          :
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: CustomColors.buttonColor,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          onPressed: () async{
                            if (_formkey.currentState.validate()) {
                              User user = await verify();
                              if(user != null){
                                print("user.name");
                                print(user.name);
                                Navigator.pushNamedAndRemoveUntil(context, Routes.newPasswordScreen,(route) => false,arguments: user);
                              }
                            }
                          },
                          child: Text(translate("Continue"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
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
