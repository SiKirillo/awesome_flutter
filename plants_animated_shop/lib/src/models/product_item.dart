import 'package:plants_animated_shop/src/models/product.dart';

class ProductItem {
  final Product? product;
  int quantity;

  ProductItem({this.product, this.quantity = 1});

  void increment() => quantity++;
}