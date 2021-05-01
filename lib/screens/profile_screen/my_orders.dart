import 'package:Vio_Telehealth/helpers/app_localizations.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/app_model.dart';
import 'package:Vio_Telehealth/widgets/container_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/profile_constants.dart';
import 'package:intl/intl.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AppViewModel>(context, listen: false)..getUserOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: CustomColors.mainColor.withOpacity(0.3),
        title: Text(
          AppLocalizations.of(context).translate("My orders"),
          style: TextStyle(
            color: CustomColors.mainColor,
          ),
        ),
      ),
      body: Consumer<AppViewModel>(
          builder: (BuildContext context, AppViewModel appModel, Widget child) =>
         ListView.builder(
            itemCount: appModel.orderList.length,
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
                          "${appModel.orderList[index].number}",
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
                          AppLocalizations.of(context).translate(appModel.orderList[index].status[0].text),
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
                            DateTime.parse(appModel.orderList[index].createdAt.toString())
                          ) }",
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
                          "${
                              DateTime.parse(appModel.orderList[index].createdAt).hour+2
                           }",
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
                          "${appModel.orderList[index].address.name}",
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
                          "${appModel.orderList[index].priceInfo.total} "+"${AppLocalizations.of(context).translate("L.E")}",
                          style: TextStyle(
                              fontSize: 20, height: 3, color: CustomColors.mainColor),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

