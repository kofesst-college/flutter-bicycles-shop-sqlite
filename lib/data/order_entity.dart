import 'package:bicycles_shop/data/user_entity.dart';
import 'package:bicycles_shop/domain/order_status.dart';

class OrderEntity {
  final int id;
  final UserEntity customer;
  final OrderStatus status;

  OrderEntity({required this.id, required this.customer, required this.status});

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
        id: map['orders.id'],
        customer: UserEntity.fromMap(map),
        status: OrderStatus.values[map['orders.status']]);
  }
}
