import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/models/cart_item.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/utils/dialogs.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:Vio_Telehealth/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';


// how do you StatelessWidget and change the data ?????
class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final int itemIndex;
  const CartItemWidget({@required this.item,@required this.itemIndex}) ;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context,cart,child){
        return Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.all(10),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.image != null ? Image.network(item.image,height: 100,width: 100,)
                :Image.asset("res/assets/images/basket.png",height: 100,width: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.option.name,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Text(
                    "${double.parse(item.option.pricePerUnit.toStringAsFixed(2))* double.parse(item.amount.toStringAsFixed(2))} "+"${AppLocalizations.of(context).translate("L.E")}",
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
                          if (item.amount >= item.option.increasingAmount) {
                            cart.setAmount(value: item.amount - item.option.increasingAmount,itemIndex:itemIndex);
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
                          "${double.parse(item.amount.toStringAsFixed(2))} "+"${item.option.unit}"  ,
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
                          cart.setAmount(value: item.amount + item.option.increasingAmount,itemIndex:itemIndex);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: InkWell(
                  child: Icon(
                    MaterialCommunityIcons.delete_sweep,
                    size: 40,
                    color: CustomColors.mainColor,
                  ),
                  onTap: ()async{
                    if(await Dialogs.confirmDialog3(context, AppLocalizations.of(context).translate("Are you sure to remove this item ?"))){
                      cart.removeFromCart(item,context);
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
