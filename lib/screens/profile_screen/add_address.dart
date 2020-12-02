import 'package:Vio_Telehealth/app/app_keys.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/models/address.dart';
import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/region_area_view_model.dart';
import 'package:flutter/material.dart';
import 'package:Vio_Telehealth/utils/validators.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:provider/provider.dart';
import './constants/profile_constants.dart';
import 'package:Vio_Telehealth/models/address.dart';

class AddAddress extends StatefulWidget {
  int index;
  UserAddress addressInfo;
  AddAddress({this.index, this.addressInfo});
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  List<String> _dropdownCities = ["Cairo", "Aswan", "Alex", "Giza"];

  List<String> _dropdownRegion = ["Cairo", "Aswan", "Alex", "Giza"];

  List<DropdownMenuItem<String>> _dropdownMenuCities;
  List<DropdownMenuItem<String>> _dropdownMenuRegion;
  String _selectedCity;
  String _selectedRegion;

  void initState() {
    super.initState();
    RegionAreaViewModel regionViewModel = Provider.of<RegionAreaViewModel>(context, listen: false)..getAreas();
    regionViewModel.resetSelected();
    
  }

  List<DropdownMenuItem> buildDropDownMenuCities(List listItems) {
    List<DropdownMenuItem> items = List();
    for (var listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  // List<DropdownMenuItem> buildDropDownMenuItems(List listItems) {
  //   List<DropdownMenuItem<String>> items = List();
  //   for (String listItem in listItems) {
  //     items.add(
  //       DropdownMenuItem(
  //         child: Text(listItem),
  //         value: listItem,
  //       ),
  //     );
  //   }
  //   return items;
  // }

  final _formkey = GlobalKey<FormState>();

  final addressNameController = TextEditingController();
  final apartmentController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    addressNameController.dispose();
    apartmentController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void addAddress(RegionAreaViewModel regionAreaViewModel) async {
    AppViewModel appModel = Provider.of<AppViewModel>(context, listen: false);
    var data = {
      "name": addressNameController.text,
      "region": regionAreaViewModel.selectedRegion.sId,
      "apartment": apartmentController.text,
      "description": descriptionController.text
    };
    try{
      await appModel.addAddress(data);
      regionAreaViewModel.resetSelected();
      Navigator.pop(context);
    }catch(e){
      UtilsFunctions.showSnackBarWithScaffoldKey(scaffoldKey: AppKeys.addLocationScreenScaffoldKey,text: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.addLocationScreenScaffoldKey,
      appBar: AppBar(
        shadowColor: CustomColors.mainColor.withOpacity(0.3),
        title: Text(
          widget.index == null
              ? AppLocalizations.of(context).translate("Add address")
              : AppLocalizations.of(context).translate("Edit address"),
          style: TextStyle(
            color: CustomColors.mainColor,
          ),
        ),
      ),
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<RegionAreaViewModel>(
              builder:(context , regionAreaViewModel , child) => Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 30, right: 30, top: 60),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: addressNameController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          labelText: AppLocalizations.of(context)
                              .translate("Address Name"),
                          labelStyle: TextStyle(color: Colors.black54),
                          icon: const Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: const Icon(
                              Icons.person,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) => UtilsFunctions.validation(
                            value,
                            Validators.isValidUserName(value),
                            AppLocalizations.of(context)
                                .translate("please enter your address name")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          isExpanded: true,
                          hint: Text(AppLocalizations.of(context)
                              .translate("Choose City")),
                          icon: Icon(Icons.location_city, size: 30),
                          value: regionAreaViewModel.selectedArea,
                          items: buildDropDownMenuCities(regionAreaViewModel.areas),
                          validator: (value) => value == null
                              ? AppLocalizations.of(context)
                                  .translate('Choose City')
                              : null,
                          onChanged: (value) {
                            regionAreaViewModel.onAreaChange(area: value);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          isExpanded: true,
                          hint: Text(AppLocalizations.of(context)
                              .translate("Choose Region")),
                          icon: Icon(Icons.location_city, size: 30),
                          value: regionAreaViewModel.selectedRegion,
                          items: buildDropDownMenuCities(regionAreaViewModel.regions),
                          validator: (value) => value == null
                              ? AppLocalizations.of(context).translate('Choose Region')
                              : null,
                          onChanged: (value) {
                            regionAreaViewModel.onChangeRegion(value);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      new TextFormField(
                        controller: apartmentController,
                        decoration: new InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .translate("Apartment number"),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                            labelStyle: TextStyle(color: Colors.black54),
                            icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child:
                                  const Icon(Icons.home, color: Colors.black54),
                            )),
                        keyboardType: TextInputType.number,
                        validator: (value) => UtilsFunctions.validation(
                            value,
                            Validators.isValidAmount(value),
                            AppLocalizations.of(context)
                                .translate("please enter your apartment number")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new TextFormField(
                        controller: descriptionController,
                        decoration: new InputDecoration(
                            labelText: AppLocalizations.of(context).translate("Description"),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                            labelStyle: TextStyle(color: Colors.black54),
                            icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.description,
                                  color: Colors.black54),
                            )),
                        keyboardType: TextInputType.text,
                        validator: (value) => UtilsFunctions.validation(
                            value,
                            Validators.isValidString(value),
                            AppLocalizations.of(context).translate(
                                "please enter your address description")),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: CustomColors.buttonColor,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              addAddress(regionAreaViewModel);
                            }
                          },
                          child: Text(
                              AppLocalizations.of(context).translate("Save"),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
