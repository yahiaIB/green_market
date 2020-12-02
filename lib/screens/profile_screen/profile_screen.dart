import 'package:Vio_Telehealth/config/auth/auth_visibility_widget.dart';
import 'package:Vio_Telehealth/config/auth/authorization.dart';
import 'package:Vio_Telehealth/config/auth/roles.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/authentication_model.dart';
import 'package:Vio_Telehealth/screens/profile_screen/constants/profile_constants.dart';
import 'package:Vio_Telehealth/screens/profile_screen/widgets/profile_list_item.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/app_lang.dart';
import 'package:Vio_Telehealth/view_models/app_status_model.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:Vio_Telehealth/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:provider/provider.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/utils/preference_utils.dart';

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

  void logout() {
    AuthenticationViewModel authenticationViewModel =
        Provider.of<AuthenticationViewModel>(context, listen: false);
    AppStatusViewModel appStatusModel =
        Provider.of<AppStatusViewModel>(context, listen: false);
    AppViewModel appViewModel =
        Provider.of<AppViewModel>(context, listen: false);
    authenticationViewModel.logOut();
    appViewModel.setGuestUser();
    appStatusModel.setStatus(AppStatus.Unauthenticated);
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
                    SizedBox(height: CustomColors.kSpacingUnit * 5.0),
                    AuthVisibilityWidget(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: CustomColors.kSpacingUnit * 15.0,
                            width: CustomColors.kSpacingUnit * 15.0,
                            margin: EdgeInsets.only(top: CustomColors.kSpacingUnit * 3.0),
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: CustomColors.kSpacingUnit * 10.0,
                                  backgroundImage: appModel.user.image == null
                                      ? AssetImage(
                                          "res/assets/images/user-picture.png")
                                      : NetworkImage(appModel.user.image),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: CustomColors.kSpacingUnit * 2.0),
                          Text(
                            '${appModel.user.name}',
                            style: CustomColors.kTitleTextStyle,
                          ),
                          SizedBox(height: CustomColors.kSpacingUnit * 0.5),
                          Text(
                            '${appModel.user.mobile}',
                            style: CustomColors.kCaptionTextStyle,
                          ),
                          SizedBox(height: CustomColors.kSpacingUnit * 2.0),
                        ],
                      ),
                      resourceName: Authorizations.personalDetailsButton,
                    ),
                    AuthVisibilityWidget(
                      child: ProfileListItem(
                        icon: LineAwesomeIcons.user_1,
                        text: AppLocalizations.of(context)
                            .translate('Personal Details'),
                        function: () {
                          Navigator.pushNamed(context, Routes.personalDetails);
                        },
                      ),
                      resourceName: Authorizations.personalDetailsButton,
                    ),
                    AuthVisibilityWidget(
                      child: ProfileListItem(
                        icon: LineAwesomeIcons.address_card,
                        text:
                            AppLocalizations.of(context).translate('Addresses'),
                        function: () {
                          Navigator.pushNamed(context, Routes.addresses);
                        },
                      ),
                      resourceName: Authorizations.personalAddressButton,
                    ),
                    AuthVisibilityWidget(
                      child: ProfileListItem(
                        icon: LineAwesomeIcons.history,
                        text:
                            AppLocalizations.of(context).translate('My orders'),
                        function: () {
                          Navigator.pushNamed(context, Routes.myOrders);
                        },
                      ),
                      resourceName: Authorizations.personalOrdersButton,
                    ),

//                    ProfileListItem(
//                      icon: LineAwesomeIcons.question_circle,
//                      text: AppLocalizations.of(context)
//                          .translate('Help & Support'),
//                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                        ).copyWith(bottom: 15),
                        child: Material(
                          elevation: 8,
                          borderRadius:
                              BorderRadius.circular(CustomColors.kSpacingUnit.w * 3),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(CustomColors.kSpacingUnit.w * 3),
                              // color: CustomColors.backgroundPrimaryProfileContainerColor,
                            ),
                            child: Row(
                              children: [
                                Icon(LineAwesomeIcons.language),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                      style: CustomColors.kTitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                  CustomColors.kLightSecondaryColor))),
                                      icon: Icon(LineAwesomeIcons.angle_down),
                                      value: languageModel.appLocal.toString(),
                                      items: buildDropDownMenuLanguage(
                                          _dropdownLanguage),
                                      validator: (value) => value == null
                                          ? AppLocalizations.of(context)
                                              .translate('Choose language')
                                          : null,
                                      onChanged: (value) {
                                        ProductViewModel productViewModel =
                                            Provider.of<ProductViewModel>(
                                                context,
                                                listen: false);
                                        CartViewModel cartViewModel =
                                            Provider.of<CartViewModel>(context,
                                                listen: false);
                                        productViewModel
                                            .fetchProductsAndCategories();
                                        cartViewModel.removeAllCartItems();
                                        languageModel.changeLanguage(value);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        )),
                    appModel.user.name == "Guest"
                        ? ProfileListItem(
                            icon: LineAwesomeIcons.alternate_sign_out,
                            text: AppLocalizations.of(context)
                                .translate('Login'),
                            hasNavigation: false,
                            color: Colors.lightGreen,
                            function: () {
                              logout();
                            },
                          )
                        : ProfileListItem(
                            icon: LineAwesomeIcons.alternate_sign_out,
                            text: AppLocalizations.of(context)
                                .translate('Logout'),
                            hasNavigation: false,
                            color: Colors.red.withOpacity(0.2),
                            function: () {
                              logout();
                            },
                          ),
                  ],
                ),
              ),
            ));
  }
}
