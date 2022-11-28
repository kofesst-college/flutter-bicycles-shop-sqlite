import 'package:bicycles_shop/domain/order.dart';
import 'package:bicycles_shop/domain/product.dart';

class OrderItem {
  final Order order;
  final Product product;
  final int amount;

  OrderItem({required this.order, required this.product, required this.amount});
}
