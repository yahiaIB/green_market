import 'package:Blwahda/helpers/app_localizations.dart';
import 'package:Blwahda/screens/common_screens/blueAppBar_screen.dart';
import 'package:Blwahda/theme/custom_assets.dart';
import 'package:Blwahda/widgets/circle_image_widget.dart';
import 'package:Blwahda/widgets/descWidget.dart';
import 'package:Blwahda/widgets/primary_button.dart';
import 'package:Blwahda/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class BlockedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueAppBarScreen(
        childWidget: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              TitleWidget(title: AppLocalizations.of(context).translate("ACCOUNT BLOCKED")),
              SizedBox(
                height: 40,
              ),
              CircleImageWidget(
                image: CustomAssets.logo,
                colors: [
                  Color.fromRGBO(232, 232, 232, 1),
                  Color.fromRGBO(174, 174, 174, 1)
                ],
              ),
              SizedBox(height: 20,),
              Text(
                AppLocalizations.of(context).translate("Sorry!"),
                style: TextStyle(
                    color: Color.fromRGBO(244, 100, 99, 1),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 25,
              ),
              DescriptionWidget(
                  desc:
                      AppLocalizations.of(context).translate("contact the support team")),
              SizedBox(height: 30,),
              PrimaryButton(
                  (){},
                AppLocalizations.of(context).translate("SUPPORT"),
                color: Color.fromRGBO(244, 100, 99, 1),
                paddingTopBottom: 17,
                paddingRightLeft: 50,
                textSize: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
