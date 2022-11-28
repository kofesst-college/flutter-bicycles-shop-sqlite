import 'package:bicycles_shop/data/category_entity.dart';

class ProductEntity {
  final int id;
  final String name;
  final double price;
  final CategoryEntity category;

  ProductEntity(
      {required this.id,
      required this.name,
      required this.price,
      required this.category});

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
        id: map['products.id'],
        name: map['products.name'],
        price: map['products.price'],
        category: CategoryEntity.fromMap(map));
  }
}
