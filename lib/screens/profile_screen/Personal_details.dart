import 'dart:io';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'constants/profile_constants.dart';
import 'package:Vio_Telehealth/screens/profile_screen/widgets/personal_data_card.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppViewModel>(context, listen: false)..init();
  }

  @override
  Widget build(BuildContext context) {
     profileInfo(AppViewModel appViewModel) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: CustomColors.kSpacingUnit.w * 15,
            width: CustomColors.kSpacingUnit.w * 15,
            margin: EdgeInsets.only(top: CustomColors.kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: CustomColors.kSpacingUnit.w * 10,
                  backgroundImage: appViewModel.user.image == null ? AssetImage("res/assets/images/user-picture.png") : NetworkImage(appViewModel.user.image),
                ),
              ],
            ),
          ),
          SizedBox(height: CustomColors.kSpacingUnit.w * 2),
        ],
      ),
    );

    header(appViewModel) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: CustomColors.kSpacingUnit.w * 3),

        profileInfo(appViewModel),
        //themeSwitcher,
        SizedBox(width: CustomColors.kSpacingUnit.w * 3),
      ],
    );

    return Consumer(
      builder: (BuildContext context, AppViewModel appModel, Widget child) =>
          Scaffold(
        appBar: AppBar(
          shadowColor: CustomColors.mainColor.withOpacity(0.3),
          title: Text(
            AppLocalizations.of(context).translate("Personal Details"),
            style: TextStyle(
              color: CustomColors.mainColor,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: CustomColors.kSpacingUnit.w * 5),
            header(appModel),
            Expanded(
              child: ListView(
                children: <Widget>[
                  PresonalDataCard(
                    data: '${appModel.user.name}',
                    icon: Icons.person,
                  ),
                  PresonalDataCard(
                    data: '${appModel.user.mobile}',
                    icon: Icons.phone,
                  ),
                  PresonalDataCard(
                    data: '${appModel.user.email}',
                    icon: Icons.email,
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            backgroundColor: CustomColors.buttonColor,
            onPressed: () {
              Navigator.pushNamed(context, Routes.editPersonalDetails,
                  arguments: {
                    "fullName": appModel.user.name,
                    "mobile": appModel.user.mobile,
                    "image": appModel.user.image,
                  });
            }),
      ),
    );
  }
}
