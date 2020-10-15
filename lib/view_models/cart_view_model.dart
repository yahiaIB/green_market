import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/models/cart_item.dart';
import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/view_models/base_model.dart';

class CartViewModel extends BaseViewModel {
  List<CartItem> _items = [];
  List<CartItem> get cartItems => _items;
  double _deliveryPrice = 7;
  double get deliveryPrice => _deliveryPrice;
  double get subTotalPrice =>
      _items.fold(0.0, (double currentTotal, CartItem nextProduct) {
        return currentTotal + (nextProduct.option.price * nextProduct.amount);
      });
  double get totalPrice => subTotalPrice + deliveryPrice;

  void addToCart(Item item) {
    CartItem cartItem = new CartItem();

    cartItem.image = item.image;
    cartItem.amount = item.amount;
    cartItem.option = item.options[item.selectedOptionIndex];

    print(cartItem.option.name);

    if (cartItem.option.isSelectedAtCart ) {
      _items.forEach((cItem) {
        if (cartItem.option.name == cItem.option.name) {
          print(cItem.amount);
          cItem.amount = cItem.amount + cartItem.amount;
          print(cItem.amount);
        }
      });
    } else {
      _items.add(cartItem);
      cartItem.option.isSelectedAtCart = true;
      print(cartItem.amount);
    }

    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }
  void setAmount({double value,int itemIndex}) {
    print(value);
    print(itemIndex);

    _items[itemIndex].amount = value;
    notifyListeners();
  }

}
