import 'package:Blwahda/helpers/app_localizations.dart';
import 'package:Blwahda/models/product_entity.dart';
import 'package:Blwahda/screens/products_screen/widgets/item_options_dialog.dart';
import 'package:Blwahda/screens/products_screen/widgets/unit_button_widget.dart';
import 'package:Blwahda/theme/custom_colors.dart';
import 'package:Blwahda/view_models/cart_view_model.dart';
import 'package:Blwahda/view_models/product_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

// how do you StatelessWidget and change the data ?????
class ProductItem extends StatefulWidget {
  final ProductEntity item;
  final int itemIndex;
  final int categoryIndex;

  ProductItem(
      {
        @required this.item,
        @required this.itemIndex,
        @required this.categoryIndex,
      });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductViewModel, CartViewModel>(
        builder: (context, productVM, cart, child) {
      return  Stack(
        children: [
          Material(
            elevation: 8,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
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
                      image: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: widget.item.image != null ?
                                NetworkImage(
                                  widget.item.image,
                                )
                                    :
                                AssetImage("res/assets/images/basket.png",),
                                fit: BoxFit.fill
                            ),
                            shape: BoxShape.circle

                        ),
                      )
                    // image: widget.item.image
                    // image: widget.item.image != null ?
                    // Image.network(
                    //   widget.item.image,
                    //   width: 100,
                    //   height: 100,
                    //   fit: BoxFit.fill,
                    // )
                    // :Image.asset("res/assets/images/basket.png",height: 100,width: 100),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.options[widget.item.selectedOptionIndex].name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${(widget.item.options[widget.item.selectedOptionIndex].pricePerUnit * widget.item.amount).toStringAsFixed(2)} "+"${AppLocalizations.of(context).translate("L.E")}",
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
                            if (widget.item.amount > widget.item.options[widget.item.selectedOptionIndex].increasingAmount) {
                              double newAmount = widget.item.amount - widget.item.options[widget.item.selectedOptionIndex].increasingAmount;
                              productVM.setAmount(
                                value: newAmount,
                                itemIndex: widget.itemIndex,
                                categoryIndex: widget.categoryIndex,
                              );
                            }
                          },
                        ),
                        Text(
                          "${widget.item.amount.toStringAsFixed(2)} "+"${widget.item.options[widget.item.selectedOptionIndex].unit}",
                        ),
                        UnitButton(
                          icon: Icons.add,
                          onTapped: () {
                            double newAmount = widget.item.amount + widget.item.options[widget.item.selectedOptionIndex].increasingAmount;
                            productVM.setAmount(value: newAmount,itemIndex:  widget.itemIndex, categoryIndex: widget.categoryIndex);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    widget.item.image != null ?
                    CachedNetworkImage(
                      imageUrl: widget.item.image,
                      width: (MediaQuery.of(context).size.width - 40)/2,
                      height: 100,
                    )
                      :Image.asset("res/assets/images/basket.png",height: 100,width: (MediaQuery.of(context).size.width - 40)/2,)

                  ],
                ),
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
                cart.addToCart(
                    product:widget.item,
                    itemIndex: widget.itemIndex,
                    categoryIndex: widget.categoryIndex,
                    optionIndex: widget.item.selectedOptionIndex
                );

                productVM.setSelectedAtCart(
                    value: true,
                    optionIndex: widget.item.selectedOptionIndex,
                    itemIndex: widget.itemIndex,
                    categoryIndex: widget.categoryIndex);

                productVM.setAmount(value: 1.0,itemIndex: widget.itemIndex,categoryIndex: widget.categoryIndex);
                Toast.show(
                    AppLocalizations.of(context).translate("Item Added"),
                    context,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM,
                    backgroundColor: CustomColors.mainColor
                );
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
