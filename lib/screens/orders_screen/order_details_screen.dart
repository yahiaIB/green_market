import 'package:Blwahda/helpers/string_translation.dart';
import 'package:Blwahda/helpers/app_localizations.dart';
import 'package:Blwahda/models/user_orders_entity.dart';
import 'package:Blwahda/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final UserOrdersEntity order;

  OrderDetailsScreen({@required this.order});

  @override
  Widget build(BuildContext context) {
    double widthSpace = (MediaQuery.of(context).size.width - 40) / 4;

    Widget quarterWidget(Widget child) {
      return Container(width: widthSpace, child: child);
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: CustomColors.mainColor.withOpacity(0.3),
        title: Text(
          translate("Order details"),
          style: TextStyle(
            color: CustomColors.mainColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate("Order number")),
                  Text("${order.number}"),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate("Order status")),
                  Text(translate(order.status[0].text.toString())),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 2,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                translate("Delivery to"),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate("Address Name")),
                  Text(order.address.name),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate("Region - Area")),
                  Text(order.address.region.name.toString() + " , " + order.address.area.name.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate("Description")),
                  Text(order.address.description),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 2,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                translate("Products"),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.mainColor,
                        blurRadius: 2,
                        spreadRadius: .2,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        quarterWidget(Text(
                          translate("Name"),
                          style: TextStyle(color: CustomColors.mainColor),
                        )),
                        quarterWidget(Text(
                          translate("Price"),
                          style: TextStyle(color: CustomColors.mainColor),
                        )),
                        quarterWidget(Text(
                          translate("Amount"),
                          style: TextStyle(color: CustomColors.mainColor),
                        )),
                        quarterWidget(Text(
                          translate("Total"),
                          style: TextStyle(color: CustomColors.mainColor),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: order.products.map<Widget>((UserOrdersProduct product) =>
                        Container(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              quarterWidget(
                                  Text(product.selectedOption.name)),
                              quarterWidget(
                                  Text("${product.priceInfo.pricePerUnit}")),
                              quarterWidget(
                                  Text("${product.priceInfo.amount}")),
                              quarterWidget(
                                  Text("${product.priceInfo.total}")),
                            ],
                          )))
                          .toList(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translate("Sub Total")),
                        quarterWidget(Text("${order.priceInfo.subTotal}")),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translate("Delivery Fees")),
                        quarterWidget(Text("${order.priceInfo.deliveryFees}")),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translate("Total")),
                        quarterWidget(Text(
                          "${order.priceInfo.total}",
                          style: TextStyle(
                              color: CustomColors.mainColor,
                              fontWeight: FontWeight.w900),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
