import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/widgets/container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'constants/profile_constants.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: mainColor.withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context).translate("My orders"),
          style: TextStyle(
            color: mainColor,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return ContainerBoxShadow(
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
                        "2092",
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
                        "New",
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
                        "Tomorrow 19 September",
                        style: TextStyle(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate("Delivery Time"),
                        style:
                            TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                      ),
                      Text(
                        "2PM - 3PM",
                        style: TextStyle(),
                      ),
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
                        "Madinty & Shorouq city",
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
                        "35.00 LE",
                        style: TextStyle(
                            fontSize: 20, height: 3, color: mainColor),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

