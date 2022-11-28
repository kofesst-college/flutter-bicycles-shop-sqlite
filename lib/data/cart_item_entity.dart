import 'package:bicycles_shop/data/product_entity.dart';
import 'package:bicycles_shop/data/user_entity.dart';

class CartItemEntity {
  final UserEntity customer;
  final ProductEntity product;
  final int amount;

  CartItemEntity(
      {required this.customer, required this.product, required this.amount});

  factory CartItemEntity.fromMap(Map<String, dynamic> map) {
    return CartItemEntity(
        customer: UserEntity.fromMap(map),
        product: ProductEntity.fromMap(map),
        amount: map['cart_items.amount']);
  }
}
