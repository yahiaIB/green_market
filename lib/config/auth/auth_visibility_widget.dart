import 'dart:convert';
import 'package:Blwahda/config/auth/authorization.dart';
import 'package:Blwahda/utils/preference_utils.dart';
import 'package:flutter/material.dart';

class AuthVisibilityWidget extends StatefulWidget {
  final String resourceName;
  final Widget child;

  AuthVisibilityWidget({@required this.resourceName, @required this.child});
  @override
  _AuthVisibilityWidgetState createState() => _AuthVisibilityWidgetState();
}

class _AuthVisibilityWidgetState extends State<AuthVisibilityWidget> {

  PreferenceUtils preferenceUtils;
  bool visible = false;

  @override
  void initState() {
    preferenceUtils = PreferenceUtils.getInstance();
    var userRoles = preferenceUtils.getData(PreferenceUtils.UserRoles);
    if(Authorizations.authorizations[widget.resourceName].contains("$userRoles")){
      visible = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: widget.child,
    );
  }
}