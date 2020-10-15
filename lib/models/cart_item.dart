import 'package:Vio_Telehealth/models/option.dart';

class CartItem{
  String image;
  double amount;
  Option option;
  CartItem({this.image,this.amount,this.option});

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(
      image: json["image"],
      amount: json["amount"],
      option: json["option"],
    );
  }
  Map<String, dynamic> toJson() => {'image':image,'amount':amount,'option':option};
}