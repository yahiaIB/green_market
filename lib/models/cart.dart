import 'package:Vio_Telehealth/models/item.dart';

class Cart{
  List<Item> items;

  //

  //
  Cart.fromMap(Map<String,dynamic> data){
    items= data['items'];
  }
  Map<String, dynamic> toMap() => {'items':items};

}