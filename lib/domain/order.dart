import 'package:bicycles_shop/domain/order_status.dart';
import 'package:bicycles_shop/domain/user.dart';

class Order {
  final int id;
  final User customer;
  final OrderStatus status;

  Order({required this.id, required this.customer, required this.status});
}
