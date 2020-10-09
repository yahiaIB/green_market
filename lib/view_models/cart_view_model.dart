import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/view_models/base_model.dart';

class CartViewModel extends BaseViewModel{
  Cart _cart;

  List<Item> get getItems => _cart.items;

  void setItem(List<Item> items){
    _cart.items = items;
  }
  double get totalPrice =>  getItems.fold(0.0, (double currentTotal, Item nextProduct) {
    return currentTotal + nextProduct.price;
  });
  void addToCart(Item item) {
    getItems.add(item);
    notifyListeners();
  }
  void removeFromCart(Item item) {
    getItems.remove(item);
    notifyListeners();
  }

}