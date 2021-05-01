import 'package:Vio_Telehealth/app/app_keys.dart';
import 'package:Vio_Telehealth/app/routes.dart';
import 'package:Vio_Telehealth/config/constants.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/models/user.dart';
import 'package:Vio_Telehealth/screens/authentication_screen/authentication_model.dart';
import 'package:Vio_Telehealth/screens/cart_screen/widgets/cart_item_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/utils/utils_functions.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:Vio_Telehealth/widgets/primary_button.dart';
import 'package:Vio_Telehealth/widgets/screen_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ScrollPhysics myScrollPhysics = NeverScrollableScrollPhysics();

  PageController controller = PageController();

  @override
  void initState() {
    CartViewModel cartViewModel =
        Provider.of<CartViewModel>(context, listen: false);
    cartViewModel.selectedAddress = null;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<CartViewModel, AppViewModel, AuthenticationViewModel>(
      builder: (context, cartModel, appModel, authenticationModel, child) {
        return Scaffold(
          key: AppKeys.confirmOrderScreenScaffoldKey,
          appBar: ScreenAppBarWithIcon(
            title: AppLocalizations.of(context).translate("Cart"),
            icon: Icons.shopping_basket,
            isIconButton: false,
          ),
          body: Center(
            child: cartModel.isCartEmpty
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
                          AppLocalizations.of(context)
                              .translate("Your cart is empty"),
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
                    physics: myScrollPhysics,
                    controller: controller,
                    onPageChanged: (page) {
                      if (page != 0) {
                        setState(() {
                          myScrollPhysics = BouncingScrollPhysics();
                        });
                      } else {
                        setState(() {
                          myScrollPhysics = NeverScrollableScrollPhysics();
                        });
                      }
                    },
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                  children: List.generate(
                                      cartModel.cartItems.length, (index) {
                                var item = cartModel.cartItems[index];
                                return CartItemWidget(
                                  item: item,
                                  itemIndex: index,
                                );
                              })),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: PrimaryButton(
                                () {
                                  authenticationModel.authenticate(() {
                                    if(cartModel.subTotalPrice > 0){
                                      controller.animateToPage(1, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                                    }
                                  }, context);
                                },
                                AppLocalizations.of(context)
                                    .translate("Checkout"),
                                paddingRightLeft: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ).copyWith(
                          bottom: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${AppLocalizations.of(context).translate("Address Name")}" +
                                      ":",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (appModel.addressesList.isEmpty) {
                                      await Navigator.pushNamed(
                                          context, Routes.addAddress);
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    margin: EdgeInsets.only(bottom: 12),
                                    child: Material(
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: appModel.busy
                                            ? CircularProgressIndicator(valueColor:  new AlwaysStoppedAnimation<Color>(CustomColors.mainColor),)
                                            : DropdownButton<UserAddress>(
                                                value:
                                                    cartModel.selectedAddress,
                                                hint: Text(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            "Select Address")),
                                                focusColor:
                                                    CustomColors.mainColor,
                                                isExpanded: true,
                                                onChanged: (UserAddress value) {
                                                  cartModel.setAddress(value);
                                                },
                                                items: appModel.addressesList
                                                    .map(
                                                      (UserAddress address) =>
                                                          DropdownMenuItem<
                                                              UserAddress>(
                                                        value: address,
                                                        child: Text(
                                                          "${address.name}",
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            cartModel.selectedAddress != null
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(AppLocalizations.of(context)
                                              .translate("Subtotal")),
                                          Text("${double.parse(cartModel.subTotalPrice.toStringAsFixed(2))} " +
                                              "${AppLocalizations.of(context).translate("L.E")}"),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(AppLocalizations.of(context)
                                              .translate("Delivery")),
                                          Text("${cartModel.selectedAddress.region.deliveryFees} " +
                                              "${AppLocalizations.of(context).translate("L.E")}"),
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
                                            AppLocalizations.of(context)
                                                .translate("Total"),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "${double.parse(cartModel.totalPrice.toStringAsFixed(2))} " +
                                                "${AppLocalizations.of(context).translate("L.E")}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      cartModel.busy ?
                                      Center(child: CircularProgressIndicator(valueColor:  new AlwaysStoppedAnimation<Color>(CustomColors.mainColor),),)
                                          :
                                      PrimaryButton(
                                        () async {
                                          try {
                                            await cartModel.createOrder();
                                            Toast.show(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        "Order Confirmed"),
                                                context,
                                                duration: Toast.LENGTH_LONG,
                                                gravity: Toast.BOTTOM,
                                                backgroundColor:
                                                    CustomColors.mainColor);
                                            Navigator.pushNamed(context, Routes.myOrders);
                                          } catch (e) {
                                            UtilsFunctions
                                                .showSnackBarWithScaffoldKey(
                                                    scaffoldKey: AppKeys
                                                        .confirmOrderScreenScaffoldKey,
                                                    text: e.toString());
                                          }
                                        },
                                        AppLocalizations.of(context)
                                            .translate("Confirm Order"),
                                        color: CustomColors.buttonColor,
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
