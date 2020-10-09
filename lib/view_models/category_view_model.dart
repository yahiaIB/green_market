import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/view_models/item_view_model.dart';

class CategoryViewModel {
  String _name;
  List<ItemViewModel> _items;
  CategoryViewModel(dynamic obj){
    _name = obj['name'];
    _items= obj['items'];
  }
  CategoryViewModel.fromMap(Map<String,dynamic> data){
    _name = data['name'];
    _items= data['items'];
  }
  Map<String, dynamic> toMap() => {'name' : _name, 'items':_items};

  String get name => _name;
 List get items => _items;
}