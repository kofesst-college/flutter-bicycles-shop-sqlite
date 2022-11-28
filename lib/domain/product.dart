import 'package:bicycles_shop/domain/category.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Category category;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.category});
}
