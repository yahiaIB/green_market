import 'dart:io';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'constants/profile_constants.dart';
import 'package:Vio_Telehealth/utils/validators.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';

class EditPersonalDetails extends StatefulWidget {
  String fullName, mobile;
  EditPersonalDetails(this.fullName, this.mobile);
  @override
  _EditPersonalDetailsState createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void editPersonalDetails() {
    AppViewModel appModel = Provider.of<AppViewModel>(context, listen: false);
    appModel.editPersonalDetails(
        nameController.text, phoneNumberController.text);
    Navigator.pop(context);
  }

  File _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.fullName;
    phoneNumberController.text = widget.mobile;
  }

  _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    print(image);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text(AppLocalizations.of(context)
                            .translate('Photo Library')),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text(
                          AppLocalizations.of(context).translate('Camera')),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    var profileInfo = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 15,
            width: kSpacingUnit.w * 15,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 10,
                  backgroundImage: _image != null
                      ? FileImage(_image)
                      : AssetImage("assets/avatar.png"),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Container(
                      height: kSpacingUnit.w * 3.5,
                      width: kSpacingUnit.w * 3.5,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        heightFactor: kSpacingUnit.w * 1.5,
                        widthFactor: kSpacingUnit.w * 1.5,
                        child: Icon(
                          LineAwesomeIcons.camera,
                          color: Colors.white,
                          size: ScreenUtil().setSp(kSpacingUnit.w * 2.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),

        profileInfo,
        //themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        shadowColor: mainColor.withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context).translate("Edit personal details"),
          style: TextStyle(
            color: mainColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: kSpacingUnit.w * 5),
            header,
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 30, right: 30, top: 60),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        labelText:
                            AppLocalizations.of(context).translate("Full Name"),
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
                              .translate("please enter your name")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new TextFormField(
                      controller: phoneNumberController,
                      decoration: new InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .translate("Phone number"),
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
                          Validators.isValidMobile(value),
                          AppLocalizations.of(context)
                              .translate("please enter your mobile number")),
                    ),
                    SizedBox(
                      height: 30,
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
                            editPersonalDetails();
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
          ],
        ),
      ),
    );
  }
}
