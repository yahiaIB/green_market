import '../../../utils/validators.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../../helpers/app_localizations.dart';
import 'package:flutter/material.dart';

class MobileInputField extends StatefulWidget {
  @override
  _MobileInputFieldState createState() => _MobileInputFieldState();
  MobileInputController controller;

  MobileInputField({this.controller});
}

class _MobileInputFieldState extends State<MobileInputField> {
  String mobile = "";
  TextEditingController _mobileController = TextEditingController();
  String countryCode = "+20";

  @override
  Widget build(BuildContext context) {
    _mobileController.addListener(onChange);
    return TextFormField(
      controller: _mobileController,
      keyboardType: TextInputType.number,
      validator: (value) => validateMobileField(value: value),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15, left: 20),
          hintText: AppLocalizations.of(context).translate('phone_number'),
          prefixIcon: CountryCodePicker(
            padding: EdgeInsets.only(left: 9),
            onChanged: (data) {
              setState(() {
                countryCode = data.toString();
                onChange();
              });
            },
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'EG',
            favorite: ['EG'],
            // optional. Shows only country name and flag
            showCountryOnly: true,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
          hintStyle: TextStyle(color: Colors.black26),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
      ),
    );
  }

  String validateMobileField({@required String value}) {
    if (!Validators.isValidMobile(value.trim())) {
      return '';
    }
    return null;
  }

  void onChange() {
    String text = _mobileController.text;
    String mobile = '$countryCode${removeAsendingZero(text)}';
    print("changing the text to ${mobile}");
    widget.controller.setText(mobile);
  }

  removeAsendingZero(String value) {
    if (value.length > 0 && value[0] == '0') {
      return removeAsendingZero(value.substring(1));
    } else {
      return value;
    }
  }
}

class MobileInputController {
  String _text = '';

  String get Text {
    return _text;
  }

  void setText(text) {
    print("Text Changed to $text");
    this._text = text;
  }
}
