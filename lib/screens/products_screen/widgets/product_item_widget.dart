import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import 'package:flutter/material.dart';


// how do you StatelessWidget and change the data ?????
class ProductItem extends StatelessWidget {
  final ItemViewModel item;
   ProductItem({
    @required this.item
  });
  List<String> options=["Option 1","Option 2","Option 3",];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            name: item.name,
            description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            buttonText: "Okay",
            options: options,
            image:Image.asset(item.image,width: 100,height: 100,),
          ),
        );
      },
      child: Stack(
        children: [
          Material(
            elevation: 8,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${item.price * item.unitValue} L.E",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.unselectedItemColor.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      UnitButton(
                        icon: Icons.remove,
                        onTapped: () {
                          if (item.unitValue >= item.unitChange) {
                            item.setUnitValue(item.unitValue - item.unitChange);
                          }
                        },
                      ),
                      Text(
                        "${item.unitValue}  KG",
                      ),
                      UnitButton(
                        icon: Icons.add,
                        onTapped: () {
                          item.setUnitValue(item.unitValue + item.unitChange);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset(item.image)
                ],
              ),
            ),
          ),
          // Consumer<Cart>(builder: (context, cart, child) {
          //   return
          Positioned(
            right: 0,
            bottom: 30,
            child: InkWell(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              onTap: () {
                if (item.selected) {
                  // cart.removeFromCart(item);
                  item.setSelected(false);
                } else {
                  // cart.addToCart(item);
                  item.setSelected(true);
                  print(item.name);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: item.selected
                        ? CustomColors.unselectedItemColor
                        : CustomColors.mainColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    )),
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
              ),
            ),
          )
          // })
        ],
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final String name, description, buttonText;
  final Image image;
  final List<String> options;
  CustomDialog({
    @required this.name,
    @required this.description,
    @required this.buttonText,
    @required this.image,
    @required this.options,
  });

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {

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
                // Text(
                //   description,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 16.0,
                //   ),
                // ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: widget.options.length,
                    itemBuilder: (context,i){
                      return RadioListTile<String>(
                          value: widget.options[i],
                          title: Text(widget.options[i]),
                          groupValue: groupValue,
                          onChanged: (value){
                            print(value);
                            setState(() {
                              groupValue = value;
                            });

                          }
                      );
                    }
                  ),
                ),
                SizedBox(height: 25.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text(widget.buttonText),
                  ),
                ),
              ],
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
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}