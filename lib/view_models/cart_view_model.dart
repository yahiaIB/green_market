import 'package:Blwahda/models/cart_item.dart';
import 'package:Blwahda/models/order_entity.dart';
import 'package:Blwahda/models/product_entity.dart';
import 'package:Blwahda/models/user.dart';
import 'package:Blwahda/repositories/order_repository.dart';
import 'package:Blwahda/repositories/user_repository.dart';
import 'package:Blwahda/view_models/base_model.dart';
import 'package:Blwahda/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartViewModel extends BaseViewModel {
  List<CartItem> _items = [];
  UserAddress selectedAddress;
  UserRepository _userRepository = new UserRepository();

  void setAddress(UserAddress selectedAddress) {
    this.selectedAddress = selectedAddress;
    notifyListeners();
  }

  OrderRepository orderRepository = new OrderRepository();

  List<CartItem> get cartItems => _items;

  Future<void> createOrder() async {
    setBusy(true);
    List<OrderProduct> products = [];
    _items.forEach((cItem) {
      products.add(
          OrderProduct(
          sId: cItem.productId,
          selectedOption: cItem.optionId,
          amount: cItem.amount
          )
      );
    });
    OrderEntity order = OrderEntity(
        products: products,
        address: selectedAddress.sId,
        total: (subTotalPrice + selectedAddress.region.deliveryFees)
    );
    try {
      await _userRepository.serverCreateOrder(order);
      _items = [];
      notifyListeners();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      throw handelError(e);
    }

  }

  double get subTotalPrice =>
      _items.fold(0.0, (double currentTotal, CartItem nextProduct) {
        return currentTotal +
            (nextProduct.option.pricePerUnit * nextProduct.amount);
      });
  double get totalPrice => subTotalPrice + selectedAddress.region.deliveryFees;

  bool get isCartEmpty => _items.isEmpty;

  void addToCart(
      {ProductEntity product,
      int itemIndex,
      int categoryIndex,
      int optionIndex}) {
    CartItem cartItem = new CartItem();

    cartItem.image = product.image;
    cartItem.amount = product.amount;
    cartItem.option = product.options[product.selectedOptionIndex];
    cartItem.productId = product.sId;
    cartItem.optionId = product.options[product.selectedOptionIndex].sId;
    cartItem.itemIndex = itemIndex;
    cartItem.categoryIndex = categoryIndex;
    cartItem.optionIndex = optionIndex;

    print(cartItem.option.name);

    if (cartItem.option.isSelectedAtCart) {
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
    Provider.of<ProductViewModel>(context, listen: false).setSelectedAtCart(
        value: false,
        itemIndex: item.itemIndex,
        categoryIndex: item.categoryIndex,
        optionIndex: item.optionIndex);
    notifyListeners();
  }

  void removeAllCartItems() {
    _items = [];
    notifyListeners();
  }

  void setAmount({double value, int itemIndex}) {
    print(value);
    print(itemIndex);

    _items[itemIndex].amount = value;
    notifyListeners();
  }
}
