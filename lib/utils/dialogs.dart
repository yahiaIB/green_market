import 'dart:ui';
import 'dart:ui' as ui;

import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/theme/custom_assets.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';


class Dialogs {
  static Widget verificationWidget(
      {context, Function onCompleted, Function resendCode}) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ImageIcon(
                    AssetImage(CustomAssets.logo),
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                VerificationCodeInput(
                  keyboardType: TextInputType.number,
                  length: 4,
                  itemSize: 35,
                  itemDecoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black38)),
                  ),
                  textStyle: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                  onCompleted: (String value) {
                    onCompleted(value);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: <Widget>[
                Text(AppLocalizations.of(context).translate("didn't_receive_code")),
                InkWell(
                    child: GestureDetector(
                        onTap: resendCode,
                        child: Text(
                          AppLocalizations.of(context).translate("resend_again"),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget pickFilesWithNameWidget(
      {context,
      TextEditingController textEditingController,
      List<dynamic> files,
      Function addNewFiles,
      Function removeFile,
      String labelText}) {
    print(files);
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                  labelText: labelText,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                  suffixIcon: Icon(
                    Icons.edit,
                    color: CustomColors.primaryColor,
                  )),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                await addNewFiles();
                setState(() {});
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(AppLocalizations.of(context).translate("add_new"))
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: files
                      .asMap()
                      .map((index, e) => MapEntry(
                            index,
                            Container(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      image: DecorationImage(
                                          image: e.runtimeType != String
                                              ? e.path.contains(".pdf") ||
                                                      e.path.contains(".PDF")
                                                  ? AssetImage(
                                                      "res/assets/images/PDF-Placeholder-240x300.png")
                                                  : FileImage(e)
                                              : e.contains(".pdf") ||
                                                      e.contains(".PDF")
                                                  ? AssetImage(
                                                      "res/assets/images/PDF-Placeholder-240x300.png")
                                                  : NetworkImage(e),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    right: 2,
                                    top: 2,
                                    child: GestureDetector(
                                      onTap: () async {
                                        await removeFile(index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                      .values
                      .toList(),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static chooseAmount({context, TextEditingController textEditingController}) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate("Amount :"),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter(RegExp("[0-9]"))
                      ],
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.grey[300],
                              width: 1,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey[300],
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text(AppLocalizations.of(context).translate("Pound")))
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      },
    );
  }

  static showSimpleDialogWithTitleAndButton(
      {context,
      Widget titleWidget,
      String textTitle,
      String buttonText,
      Function buttonAction,
      Color buttonColor,
      Widget child}) {
    return showDialog(
      context: context,
      builder: (context) {
        bool waiting = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              child: SimpleDialog(
                elevation: 14.0,
                contentPadding: EdgeInsets.all(25),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 2,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        titleWidget != null
                            ? titleWidget
                            : Text(
                                textTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                        child,
                        buttonAction != null ? PrimaryButton(
                          () async {
                            print(waiting);
                            if(!waiting){
                              setState((){
                                waiting = true;
                              });
                              print(waiting);
                              await buttonAction();
                              setState((){
                                waiting = false;
                              });
                            }
                          },
                          waiting ? "Waiting...." : buttonText,
                          textSize: 16,
                          color: buttonColor,
                          paddingRightLeft: 40,
                          paddingTopBottom: 15,
                        ) : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static showAmanDialog({context, billReference}) {
    return showDialog(
      context: context,
      child: SimpleDialog(
        elevation: 0.0,
        contentPadding: EdgeInsets.all(20),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(AppLocalizations.of(context).translate('aman_ref')),
                SizedBox(
                  height: 13,
                ),
                Container(
                  padding: EdgeInsets.only(right: 8,left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black12
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        billReference,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor, fontSize: 30),
                      ),
                      SizedBox(width: 5,),
                      IconButton(
                        icon: Icon(Icons.content_copy),
                        onPressed: ()=> Clipboard.setData(ClipboardData(text: billReference)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FlatButton(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 9, bottom: 9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool> confirmDialog3(BuildContext context, title) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Container(
            child: new AlertDialog(
              title: new Text(title),
              actions: <Widget>[
                new FlatButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                new FlatButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ),
          );
        });
  }

  static Future<bool> confirmDialogWithLabels(BuildContext context, title,trueLabel,falseLabel) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Container(
            child: new AlertDialog(
              title: new Text(title),
              actions: <Widget>[
                new FlatButton(
                  child:  Text(trueLabel),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                new FlatButton(
                  child:  Text(falseLabel),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ),
          );
        });
  }

  static Widget writeDescriptionTextEditing(
      {context,
      TextEditingController textEditingController,
      String labelText}) {
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          controller: textEditingController,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: labelText,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black26)),
          ),
        );
      },
    );
  }
}
