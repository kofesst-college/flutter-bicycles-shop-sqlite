import 'package:bicycles_shop/domain/product.dart';
import 'package:bicycles_shop/domain/user.dart';

class CartItem {
  final User customer;
  final Product product;
  final int amount;

  CartItem(
      {required this.customer, required this.product, required this.amount});
}
