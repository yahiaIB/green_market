// import 'package:Blwahda/models/cart_item.dart';
// import 'package:Blwahda/models/item.dart';
//
// class Cart{
//   List<CartItem> items;
//
//   Cart({this.items});
//
//   factory Cart.fromJson(Map<String, dynamic> json){
//     var list = json['items'] as List;
//     List<CartItem> itemsList = list.map((i) => CartItem.fromJson(i)).toList();
//     return Cart(
//         items: itemsList
//     );
//   }
//   Map<String, dynamic> toJson() => {'items':items};
//
// }