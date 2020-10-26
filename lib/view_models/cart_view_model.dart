import 'package:Vio_Telehealth/models/cart.dart';
import 'package:Vio_Telehealth/models/cart_item.dart';
import 'package:Vio_Telehealth/models/item.dart';
import 'package:Vio_Telehealth/models/product_entity.dart';
import 'package:Vio_Telehealth/view_models/base_model.dart';
import 'package:Vio_Telehealth/view_models/product_view_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CartViewModel extends BaseViewModel {
  List<CartItem> _items = [];
  List<CartItem> get cartItems => _items;
  double _deliveryPrice = 7;
  double get deliveryPrice => _deliveryPrice;
  double get subTotalPrice =>
      _items.fold(0.0, (double currentTotal, CartItem nextProduct) {
        return currentTotal + (nextProduct.option.pricePerUnit * nextProduct.amount);
      });
  double get totalPrice => subTotalPrice + deliveryPrice;

  void addToCart({ProductEntity product,int itemIndex,int categoryIndex,int optionIndex}) {
    CartItem cartItem = new CartItem();

    cartItem.image = product.image;
    cartItem.amount = product.amount;
    cartItem.option = product.options[product.selectedOptionIndex];
    cartItem.itemIndex = itemIndex;
    cartItem.categoryIndex = categoryIndex;
    cartItem.optionIndex= optionIndex;

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

  void removeFromCart(CartItem item, BuildContext context) {
    _items.remove(item);
    Provider.of<ItemViewModel>(context, listen: false).setSelectedAtCart(value: false,itemIndex: item.itemIndex,categoryIndex: item.categoryIndex,optionIndex: item.optionIndex);
    notifyListeners();
  }
  void setAmount({double value,int itemIndex}) {
    print(value);
    print(itemIndex);

    _items[itemIndex].amount = value;
    notifyListeners();
  }

}
