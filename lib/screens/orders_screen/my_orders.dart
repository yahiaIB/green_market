import 'package:Blwahda/helpers/app_localizations.dart';
import 'package:Blwahda/screens/orders_screen/widget/order_item_widget.dart';
import 'package:Blwahda/theme/custom_colors.dart';
import 'package:Blwahda/view_models/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/order_item_widget.dart';


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
                  return OrderItemWidget(
                    order: appModel.orderList[index],
                  );
                }),
      ),
    );
  }
}
