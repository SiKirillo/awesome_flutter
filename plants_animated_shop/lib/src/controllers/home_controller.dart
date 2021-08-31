import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/models/product.dart';
import 'package:plants_animated_shop/src/models/product_item.dart';

enum HomeState {
  normal,
  cart,
}

class HomeController extends ChangeNotifier {
  final List<ProductItem> _cart = [];
  HomeState _homeState = HomeState.normal;

  List<ProductItem> get cart => _cart;

  HomeState get homeState => _homeState;

  void changeHomeState(HomeState state) {
    _homeState = state;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    for (ProductItem item in _cart) {
      if (item.product!.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }

    _cart.add(ProductItem(product: product));
    notifyListeners();
  }

  int totalCartItems() => _cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
