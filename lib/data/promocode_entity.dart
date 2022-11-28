class PromoCodeEntity {
  final int id;
  final String code;
  final bool enabled;

  PromoCodeEntity(
      {required this.id, required this.code, required this.enabled});

  factory PromoCodeEntity.fromMap(Map<String, dynamic> map) {
    return PromoCodeEntity(
        id: map['promocodes.id'],
        code: map['promocodes.code'],
        enabled: map['promocodes.enabled']);
  }
}
