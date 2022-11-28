class CategoryEntity {
  final int id;
  final String name;

  CategoryEntity({required this.id, required this.name});

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
        id: map['categories.id'], name: map['categories.name']);
  }
}
