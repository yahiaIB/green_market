import 'package:Vio_Telehealth/view_models/base_model.dart';

class ItemViewModel extends BaseViewModel {
  String _name;
  String _image;
  double _price;
  double _unitValue;
  double _unitChange ;

  bool _selected = false;

  ItemViewModel(dynamic obj){
    _name = obj['name'];
    _image = obj['image'];
    _price= obj['price'];
    _unitValue = obj['unitValue'];
    _unitChange = obj['unitChange'];
  }
  ItemViewModel.fromMap(Map<String,dynamic> data){
    _name = data['name'];
    _image = data['image'];
    _price= data['price'];
    _unitValue = data['unitValue'];
    _unitChange = data['unitChange'];

  }
  Map<String, dynamic> toMap() => {'name' : _name,'image' : _image, 'price':_price, 'unitValue':_unitValue, 'unitChange':_unitChange};

  String get name => _name;
  String get image => _image;
  double get price => _price;
  double get unitValue => _unitValue;
  double get unitChange => _unitChange;

  bool get selected => _selected;

  void setSelected(bool value) {
    _selected = value;
    notifyListeners();
  }
  void setUnitValue(double value) {
    _unitValue = value;
    notifyListeners();
  }
}