import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/models/option.dart';
import 'package:Vio_Telehealth/screens/cart_screen/widgets/cart_item_widget.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import 'package:Vio_Telehealth/widgets/primary_button.dart';
import 'package:Vio_Telehealth/widgets/screen_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context,cart,child){
        return Scaffold(
            appBar:ScreenAppBar(title: "Cart",icon: Icons.shopping_basket,isIconButton: false,),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        children: List.generate(cart.cartItems.length, (index) {
                          var item = cart.cartItems[index];
                          return CartItemWidget(item: item,itemIndex: index,);
                        })),
                  ),
                  cart.cartItems.isNotEmpty ?
                  Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal"),
                              Text("${cart.subTotalPrice}"),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery"),
                              Text("${cart.deliveryPrice} L.E"),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "${cart.totalPrice} L.E",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          PrimaryButton(
                                () {
                                  Toast.show(
                                      "Order Confirmed",
                                      context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor: CustomColors.mainColor
                                  );
                                },
                            "Confirm Order",
                            color: CustomColors.mainColor,
                          ),
                        ],
                      ))
                  : Container(),
                ],
              ),
            ));
      },
    );
  }
}
