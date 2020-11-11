import 'package:Vio_Telehealth/models/option.dart';
import 'package:Vio_Telehealth/models/product_entity.dart';

class CartItem{
  String image;
  double amount;
  ProductOption option;

  String productId;
  String optionId;

  int itemIndex;
  int categoryIndex;
  int optionIndex;

  CartItem({this.image,this.amount,this.option,this.productId,this.optionId,this.itemIndex,this.categoryIndex,this.optionIndex});

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(
      image: json["image"],
      amount: json["amount"],
      option: json["option"],
      productId: json["productId"],
      optionId: json["optionId"],
      itemIndex: json["itemIndex"],
      categoryIndex: json["categoryIndex"],
      optionIndex: json["optionIndex"],

    );
  }
  Map<String, dynamic> toJson() => {'image':image,'amount':amount,'option':option,'productId':productId,'optionId':optionId,'itemIndex':itemIndex,'categoryIndex':categoryIndex,'optionIndex':optionIndex};
}