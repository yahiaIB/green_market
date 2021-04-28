import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/models/product_entity.dart';
import 'package:Vio_Telehealth/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemOptionsDialog extends StatefulWidget {
  final String name, buttonText;

  final Widget image;
  final int optionIndex;
  final int itemIndex;
  final int categoryIndex;
  final List<ProductOption> options;
  ItemOptionsDialog({
    @required this.name,
    @required this.buttonText,
    @required this.image,
    @required this.optionIndex,
    @required this.itemIndex,
    @required this.categoryIndex,
    @required this.options,
  });

  @override
  _ItemOptionsDialogState createState() => _ItemOptionsDialogState();
}

class _ItemOptionsDialogState extends State<ItemOptionsDialog> {
  String groupValue;
  int selectedOptionDialogIndex;
  @override
  void initState() {
    super.initState();
    groupValue = widget.options[widget.optionIndex].name;
    selectedOptionDialogIndex = widget.optionIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder:(context,itemVM,child){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Consts.padding),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: Consts.avatarRadius + Consts.padding,
                  bottom: Consts.padding,
                  left: Consts.padding,
                  right: Consts.padding,
                ),
                margin: EdgeInsets.only(top: Consts.avatarRadius),
                decoration: new BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(Consts.padding),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // To make the card compact
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Column(
                          children: widget.options
                              .map((option) => new RadioListTile(
                              value: option.name,
                              title: Text.rich(TextSpan(
                                  text: '${option.name} ',
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: " ${option.pricePerUnit} " + "${AppLocalizations.of(context).translate("L.E")}/${option.unit}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              groupValue: groupValue,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  selectedOptionDialogIndex = widget.options.indexOf(option);
                                  groupValue = value;
                                });
                              }))
                              .toList()),
                      SizedBox(height: 25.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          onPressed: () {

                            itemVM.setSelectedOptionIndex(optionIndex: selectedOptionDialogIndex,itemIndex:widget.itemIndex,categoryIndex: widget.categoryIndex );

                            Navigator.of(context).pop(); // To close the dialog
                          },
                          child: Text(widget.buttonText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: Consts.padding,
                right: Consts.padding,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Consts.avatarRadius,
                  child: widget.image,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
