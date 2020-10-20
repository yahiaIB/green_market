import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/widgets/container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/profile_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/app_lang.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Addresses extends StatefulWidget {
  @override
  _AddressesState createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, Routes.addAddress);
            },
            iconSize: 30,
            color: mainColor,
            //disabledColor: mainColor,
          )
        ],
        shadowColor: mainColor.withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context).translate("My addresses"),
          style: TextStyle(
            color: mainColor,
          ),
        ),
      ),
      body: Consumer2<AppViewModel, AppLanguage>(
        builder: (BuildContext context, AppViewModel appModel,
                AppLanguage languageModel, Widget child) =>
            ListView.builder(
                itemCount: appModel.addressesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ContainerBoxShadow(
                      child: Stack(
                        children: [
                          Positioned(
                            right: languageModel.appLocal == Locale("ar") ? null : 0,
                            top: 0,
                            left: languageModel.appLocal == Locale("ar") ? 0 : null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Iconsbuttons(
                                  iconData: Icon(LineAwesomeIcons.edit),
                                  color: Colors.green,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.addAddress, arguments: {
                                      "index": index,
                                      "address": appModel.addressesList[index]
                                    });
                                  },
                                ),
                                Iconsbuttons(
                                    iconData: Icon(Icons.delete),
                                    color: mainColor,
                                    onTap: () => appModel.deleteAddress(index))
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${appModel.addressesList[index].name}",
                                  style: TextStyle(color: Colors.grey)),
                              Text(
                                AppLocalizations.of(context)
                                        .translate("City : ") +
                                    "${appModel.addressesList[index].area}",
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.5),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                        .translate("Region : ") +
                                    "${appModel.addressesList[index].region}",
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.5),
                              ),
                              Text(
                                AppLocalizations.of(context).translate("Apartment : ") +
                                    "${appModel.addressesList[index].apartment}",
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.5),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                        .translate("Address : ") +
                                    "${appModel.addressesList[index].description}",
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.5),
                              ),
                            ],
                          ),
                        ],
                      ));
                }),
      ),
    );
  }
}

class Iconsbuttons extends StatelessWidget {
  final Icon iconData;
  final Color color;
  final Function onTap;

  Iconsbuttons(
      {@required this.color, @required this.iconData, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: iconData,
        color: color,
        iconSize: ScreenUtil().setSp(kSpacingUnit.w * 3),
        onPressed: onTap);
  }
}
