import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/features/products/model/product_model.dart';
import 'package:shop_app/product/service/user_service.dart';

class User extends ChangeNotifier {
  Map<ProductModel, int> cartProducts = {};

  List<ProductModel> get cartItems => cartProducts.keys.toList();

  UserService? service;

  User(BuildContext context) {
    service = context.read<UserService>();
  }

  double get cartProductsTotalCost {
    if (cartProducts.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      cartProducts.forEach((key, value) {
        _total += key.price! * value;
      });
      return _total;
    }
  }

  int get numberOfProduct {
    return cartProducts.length;
  }

  void getProduct(ProductModel item) {}

  void addFirstItemToCart(ProductModel product) {
    cartProducts[product] = 1;
    service?.addProduct(product);
    notifyListeners();
  }

  void addItemToCart(ProductModel product) {
    if (cartProducts[product] == null) {
      addFirstItemToCart(product);
      return;
    } else {
      cartProducts[product] = cartProducts[product]! + 1;
    }
    notifyListeners();
  }

  void removeItemFromCart(ProductModel product) {
    if (cartProducts[product] == null) return;
    if (cartProducts[product] == 0) {
      cartProducts.removeWhere((key, value) => key == product);
    } else {
      cartProducts[product] = cartProducts[product]! - 1;
    }
    notifyListeners();
  }
}
