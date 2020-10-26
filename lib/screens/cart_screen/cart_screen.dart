import 'package:Vio_Telehealth/config/constants.dart';
import 'package:Vio_Telehealth/models/address.dart';
import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/models/option.dart';
import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/screens/cart_screen/widgets/cart_item_widget.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:Vio_Telehealth/view_models/product_view_model.dart';
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
  UserAddress selectedAddress;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Consumer2<CartViewModel, AppViewModel>(
      builder: (context, cart, appModel, child) {
        return Scaffold(
            appBar: ScreenAppBar(
              title: "Cart",
              icon: Icons.shopping_basket,
              isIconButton: false,
            ),
            body: Center(
              child: cart.cartItems.isEmpty
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Constants.emptyCartImage(),
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Your cart is empty",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.mainColor),
                          )
                        ],
                      ),
                    )
                  : PageView(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      // reverse: true,
                      // physics: BouncingScrollPhysics(),
                      controller: controller,

                      onPageChanged: (num) {
                        setState(() {

                        });
                      },
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                    children:
                                    List.generate(cart.cartItems.length, (index) {
                                      var item = cart.cartItems[index];
                                      return CartItemWidget(
                                        item: item,
                                        itemIndex: index,
                                      );
                                    })),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: PrimaryButton(
                                        (){
                                          controller.animateToPage(1, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                                          },
                                    "Checkout",
                                  paddingRightLeft: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,).copyWith(bottom: 20,),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Address Name:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width - 200,
                                      margin: EdgeInsets.only(bottom: 12),
                                      child: Material(
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child:
                                              new DropdownButton<UserAddress>(
                                            value: selectedAddress,
                                            hint: Text("Select Address"),
                                            focusColor: CustomColors.mainColor,
                                            isExpanded: true,
                                            onChanged: (UserAddress value) {
                                              setState(() {
                                                selectedAddress = value;
                                              });
                                            },
                                            items: appModel.addressesList.map(
                                                  (UserAddress address) =>
                                                      DropdownMenuItem<UserAddress>(
                                                    value: address,
                                                    child: Text("${address.name}",),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Subtotal"),
                                    Text("${cart.subTotalPrice}"),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivery"),
                                    Text("${cart.deliveryPrice} L.E"),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "${cart.totalPrice} L.E",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                PrimaryButton(
                                  () {
                                    Toast.show("Order Confirmed", context,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM,
                                        backgroundColor:
                                            CustomColors.mainColor);
                                  },
                                  "Confirm Order",
                                  color: CustomColors.mainColor,
                                ),
                              ],
                            ))
                      ],
                    ),
            ));
      },
    );
  }
}
