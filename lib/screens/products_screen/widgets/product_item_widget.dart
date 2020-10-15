import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/item_options_dialog.dart';
import 'package:Vio_Telehealth/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Vio_Telehealth/theme/custom_colors.dart';
import 'package:Vio_Telehealth/view_models/cart_view_model.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

// how do you StatelessWidget and change the data ?????
class ProductItem extends StatefulWidget {
  final Item item;
  final int itemIndex;
  final int categoryIndex;

  ProductItem(
      {@required this.item,
      @required this.itemIndex,
      @required this.categoryIndex});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ItemViewModel, CartViewModel>(
        builder: (context, itemConsumer, cart, child) {
      return Stack(
        children: [
          Material(
            elevation: 8,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.options[widget.item.selectedOptionIndex].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.item.options[widget.item.selectedOptionIndex].price * widget.item.amount} L.E",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.unselectedItemColor.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UnitButton(
                        icon: Icons.remove,
                        onTapped: () {
                          print("widget.item");
                          print(widget.item);
                          print(widget.item.amount);
                          print(widget.item
                              .options[widget.item.selectedOptionIndex].name);
                          if (widget.item.amount >
                              widget
                                  .item
                                  .options[widget.item.selectedOptionIndex]
                                  .unitChange) {
                            double newAmount = widget.item.amount -
                                widget
                                    .item
                                    .options[widget.item.selectedOptionIndex]
                                    .unitChange;
                            itemConsumer.setAmount(
                              value: newAmount,
                              itemIndex: widget.itemIndex,
                              categoryIndex: widget.categoryIndex,
                            );
                            print(widget.item.amount);
                          }
                        },
                      ),
                      Text(
                        "${widget.item.amount}  KG",
                      ),
                      UnitButton(
                        icon: Icons.add,
                        onTapped: () {
                          print(widget.item.amount);
                          double newAmount = widget.item.amount + widget.item.options[widget.item.selectedOptionIndex].unitChange;
                          itemConsumer.setAmount(value: newAmount,itemIndex:  widget.itemIndex, categoryIndex: widget.categoryIndex);
                          print(widget.item.amount);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => ItemOptionsDialog(
                            name: widget.item
                                .options[widget.item.selectedOptionIndex].name,
                            buttonText: "Okay",
                            options: widget.item.options,
                            optionIndex: widget.item.selectedOptionIndex,
                            itemIndex: widget.itemIndex,
                            categoryIndex: widget.categoryIndex,
                            image: Image.asset(
                              widget.item.image,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(widget.item.image,height: 100,width: (MediaQuery.of(context).size.width - 40)/2,))
                ],
              ),
            ),
          ),
          // Consumer<Cart>(builder: (context, cart, child) {
          //   return
          Positioned(
            right: 0,
            bottom: 30,
            child: InkWell(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              onTap: () {
                cart.addToCart(widget.item);
                Toast.show(
                    "Item is Added",
                    context,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM,
                    backgroundColor: CustomColors.mainColor
                );
                itemConsumer.setSelectedAtCart(
                    value: true,
                    optionIndex: widget.item.selectedOptionIndex,
                    itemIndex: widget.itemIndex,
                    categoryIndex: widget.categoryIndex);

                itemConsumer.setAmount(value: 1.0,itemIndex: widget.itemIndex,categoryIndex: widget.categoryIndex);

                print(widget.item.options[widget.item.selectedOptionIndex].name);
              },
              child: Container(
                decoration: BoxDecoration(
                    color:
                        // widget.item.options[widget.item.selectedOptionIndex].isSelectedAtCart ?
                        //     CustomColors.unselectedItemColor
                        // :
                        CustomColors.mainColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    )),
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
              ),
            ),
          )
          // })
        ],
      );
    });
  }
}
