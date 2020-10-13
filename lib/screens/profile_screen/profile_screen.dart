import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/screens/profile_screen/constants/profile_constants.dart';
import 'package:Vio_Telehealth/screens/profile_screen/widgets/profile_list_item.dart';
import 'package:Vio_Telehealth/view_models/app_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:provider/provider.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, String>> _dropdownLanguage = [
    {"name": "Arabic", "value": "ar"},
    {"name": "English", "value": "en"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    List<DropdownMenuItem> buildDropDownMenuLanguage(List listItems) {
      List<DropdownMenuItem<String>> items = List();
      for (Map listItem in listItems) {
        items.add(
          DropdownMenuItem(
            child:
                Text(AppLocalizations.of(context).translate(listItem["name"])),
            value: listItem["value"],
          ),
        );
      }
      return items;
    }

    return Consumer2<AppViewModel, AppLanguage>(
      builder: (BuildContext context, AppViewModel appModel,
              AppLanguage languageModel, Widget child) =>
          Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: kSpacingUnit * 5.0),
              Column(
                children: <Widget>[
                  Container(
                    height: kSpacingUnit * 15.0,
                    width: kSpacingUnit * 15.0,
                    margin: EdgeInsets.only(top: kSpacingUnit * 3.0),
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: kSpacingUnit * 10.0,
                          //backgroundImage: AssetImage('res/assets/images/m.png'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kSpacingUnit * 2.0),
                  Text(
                    '${appModel.user.fullName}',
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height: kSpacingUnit * 0.5),
                  Text(
                    '${appModel.user.mobile}',
                    style: kCaptionTextStyle,
                  ),
                  SizedBox(height: kSpacingUnit * 2.0),
                ],
              ),
              ProfileListItem(
                icon: LineAwesomeIcons.user_1,
                text:
                    AppLocalizations.of(context).translate('Personal Details'),
                function: () {
                  Navigator.pushNamed(context, Routes.personalDetails);
                },
              ),
              ProfileListItem(
                icon: LineAwesomeIcons.address_card,
                text: AppLocalizations.of(context).translate('Addresses'),
                function: () {
                  Navigator.pushNamed(context, Routes.addresses);
                },
              ),
              ProfileListItem(
                icon: LineAwesomeIcons.history,
                text: AppLocalizations.of(context).translate('My orders'),
                function: () {
                  Navigator.pushNamed(context, Routes.myOrders);
                },
              ),
              ProfileListItem(
                icon: LineAwesomeIcons.question_circle,
                text: AppLocalizations.of(context).translate('Help & Support'),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                      color: kLightSecondaryColor,
                    ),
                    child: Row(
                      children: [
                        Icon(LineAwesomeIcons.language),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                              style: kTitleTextStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kLightSecondaryColor))),
                              icon: Icon(LineAwesomeIcons.angle_down),
                              value: languageModel.appLocal.toString(),
                              items:
                                  buildDropDownMenuLanguage(_dropdownLanguage),
                              validator: (value) => value == null
                                  ? AppLocalizations.of(context)
                                      .translate('Choose language')
                                  : null,
                              onChanged: (value) {
                                languageModel.changeLanguage(value);
                              }),
                        ),
                      ],
                    ),
                  )),
              ProfileListItem(
                icon: LineAwesomeIcons.alternate_sign_out,
                text: AppLocalizations.of(context).translate('Logout'),
                hasNavigation: false,
                color: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
