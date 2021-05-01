import 'package:Vio_Telehealth/app/routes.dart';
import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/models/user_orders_entity.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/widgets/container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItemWidget extends StatelessWidget {
  final UserOrdersEntity order;

  OrderItemWidget({this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, Routes.orderDetails,arguments: order),
      child: ContainerBoxShadow(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("Order Number"),
                  style:
                  TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
                Text(
                  "${order.number}",
                  style: TextStyle(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("Status"),
                  style:
                  TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
                Text(
                  order.status[0].text,
                  style: TextStyle(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("Delivery Date"),
                  style:
                  TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
                Text(
                  "${DateFormat('dd-MM-yyyy').format(
                      DateTime.parse(order.createdAt.toString())
                  ) }",
                  style: TextStyle(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("Address"),
                  style:
                  TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
                Text(
                  "${order.address.name}",
                  style: TextStyle(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("Total"),
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      height: 3),
                ),
                Text(
                  "${order.priceInfo.total} "+"${AppLocalizations.of(context).translate("L.E")}",
                  style: TextStyle(
                      fontSize: 20, height: 3, color: CustomColors.mainColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
