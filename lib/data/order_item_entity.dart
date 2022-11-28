import 'package:bicycles_shop/data/order_entity.dart';
import 'package:bicycles_shop/data/product_entity.dart';

class OrderItemEntity {
  final OrderEntity order;
  final ProductEntity product;
  final int amount;

  OrderItemEntity(
      {required this.order, required this.product, required this.amount});

  factory OrderItemEntity.fromMap(Map<String, dynamic> map) {
    return OrderItemEntity(
        order: OrderEntity.fromMap(map),
        product: ProductEntity.fromMap(map),
        amount: map['order_items.amount']);
  }
}
