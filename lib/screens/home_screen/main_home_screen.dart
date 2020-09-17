import 'package:Vio_Telehealth/config/constants.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/theme/custom_assets.dart';
import 'package:Vio_Telehealth/utils/firebase_notification_handler.dart';
import 'package:flutter/material.dart';
class MainHomeScreen extends StatefulWidget {
  @override
  MainHomeScreenState createState() => MainHomeScreenState();

}

class MainHomeScreenState extends State<MainHomeScreen> {
  int _page = 0;

  onChangePage(index) {
    setState(() {
      _page = index;
    });
  }

  List<String> pagesTitles = [
    "Home",
    "History",
    "Wallet",
    "Profile"
  ];

  List<Widget> pages ;

  @override
  void initState() {
//    FirebaseLocalNotifications().setUpFirebase(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Constants.mainScreenScaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(AppLocalizations.of(context).translate("boilerplate")),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )
        ),
        child: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
