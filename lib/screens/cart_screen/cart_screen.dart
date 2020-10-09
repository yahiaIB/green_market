import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/screens/cart_screen/widgets/cart_item_widget.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import 'package:Vio_Telehealth/widgets/primary_button.dart';
import 'package:Vio_Telehealth/widgets/screen_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ItemViewModel> cartItems = [
    new ItemViewModel({
      'name': "tomato",
      'image': "res/assets/images/tomato.png",
      'price': 5.0,
      'unitValue': 1.0,
      'unitChange': 0.25
    }),
    new ItemViewModel({
      'name': "banana",
      'image': "res/assets/images/banana.png",
      'price': 15.0,
      'unitValue': 1.0,
      'unitChange': 0.25
    }),
    new ItemViewModel({
      'name': "cucumber",
      'image': "res/assets/images/cucumber.png",
      'price': 6.0,
      'unitValue': 1.0,
      'unitChange': 0.25
    }),
    new ItemViewModel({
      'name': "cucumber",
      'image': "res/assets/images/cucumber.png",
      'price': 6.0,
      'unitValue': 1.0,
      'unitChange': 0.25
    }),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    children: List.generate(cartItems.length, (index) {
                      var item = cartItems[index];
                      return CartItem(item: item);
                    })),
              ),
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
                          Text("26 L.E"),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery"),
                          Text("7 L.E"),
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
                            "33 L.E",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      PrimaryButton(
                        () {},
                        "Confirm Oreder",
                        color: CustomColors.mainColor,
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
