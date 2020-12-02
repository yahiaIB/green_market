import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/widgets/container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
  void initState() {
    Provider.of<AppViewModel>(context, listen: false)..getUserAddresses();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
               await Navigator.pushNamed(context, Routes.addAddress);
               Provider.of<AppViewModel>(context, listen: false)..getUserAddresses();
            },
            iconSize: 30,
            color: CustomColors.mainColor,
            //disabledColor: mainColor,
          )
        ],
        shadowColor: CustomColors.mainColor.withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context).translate("My addresses"),
          style: TextStyle(
            color: CustomColors.mainColor,
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
                                IconsButtons(
                                    iconData: Icon(
                                      MaterialCommunityIcons.delete_sweep,
                                    ),
                                    color: Colors.red,
                                    onTap: () => appModel.deleteAddress(index ,appModel.addressesList[index].sId ))
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
                                AppLocalizations.of(context).translate("City : ") +
                                    "${appModel.addressesList[index].area.name}",
                                style: CustomColors.kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.5),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                        .translate("Region : ") +
                                    "${appModel.addressesList[index].region.name}",
                                style: CustomColors.kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.5),
                              ),
                              Text(
                                AppLocalizations.of(context).translate("Apartment : ") +
                                    "${appModel.addressesList[index].apartment}",
                                style: CustomColors.kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.5),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                        .translate("Address : ") +
                                    "${appModel.addressesList[index].description}",
                                style: CustomColors.kTitleTextStyle.copyWith(
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

class IconsButtons extends StatelessWidget {
  final Icon iconData;
  final Color color;
  final Function onTap;

  IconsButtons(
      {@required this.color, @required this.iconData, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: iconData,
        color: color,
        iconSize: ScreenUtil().setSp(CustomColors.kSpacingUnit.w * 3),
        onPressed: onTap);
  }
}
