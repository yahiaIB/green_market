import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


// how do you StatelessWidget and change the data ?????
class CartItem extends StatelessWidget {
  final ItemViewModel item;
  const CartItem({@required this.item}) ;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.mainColor.withOpacity(0.05),
                    offset: Offset(0, 8),
                    blurRadius: 6,
                    spreadRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(30)
            ),
            child:Row(
              children: [
                Image.asset(item.image,height: 180,width: 180,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Text(
                      "${item.price * item.unitValue}  L.E",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.unselectedItemColor.withOpacity(0.3),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        UnitButton(
                          icon: Icons.remove,
                          onTapped: () {
                            if (item.unitValue >= item.unitChange) {
                              item.setUnitValue(
                                  item.unitValue -
                                      item.unitChange);
                            }
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: CustomColors.mainColor.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text(
                            "${item.unitValue}  KG",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.mainColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        UnitButton(
                          icon: Icons.add,
                          onTapped: () {
                            item.setUnitValue(
                                item.unitValue +
                                    item.unitChange);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 30,
            child: InkWell(
              child: Icon(
                MaterialCommunityIcons.delete_sweep,
                size: 40,
                color: CustomColors.mainColor,
              ),
              onTap: (){},
            ),
          )
        ]
    );
  }
}
