import 'package:Blwahda/app/app_keys.dart';
import 'package:Blwahda/app/routes.dart';
import 'package:Blwahda/helpers/app_localizations.dart';
import 'package:Blwahda/helpers/string_translation.dart';
import 'package:Blwahda/screens/authentication_screen/authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:Blwahda/utils/validators.dart';
import 'package:Blwahda/theme/custom_colors.dart';
import 'package:Blwahda/utils/utils_functions.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    super.dispose();
  }

 forgetPassword() async{
    AuthenticationViewModel authenticationModel = Provider.of<AuthenticationViewModel>(context, listen: false);
    try{
      var data = await authenticationModel.forgetPassword(email: emailController.text);
      return data;
    }catch(e){
      UtilsFunctions.showSnackBarWithScaffoldKey(scaffoldKey: AppKeys.forgetPasswordScreenScaffoldKey, text: e.message == "UserWithEmailNotExist" ? translate("User With This Email Does Not Exist"): e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.forgetPasswordScreenScaffoldKey,
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        shadowColor: CustomColors.mainColor.withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context).translate("Forget Password"),
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
                        AppLocalizations.of(context)
                            .translate("Enter your email"),
                        style: TextStyle(
                          fontSize: 20,
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
                        labelText:
                            AppLocalizations.of(context).translate("Enter Email"),
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
                              var data = await forgetPassword();
                              if(data != null){
                                Navigator.pushNamed(context, Routes.verificationCodeScreen,arguments: data);
                              }
                            }
                          },
                          child: Text(
                              AppLocalizations.of(context).translate("Continue"),
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
