import 'package:bicycles_shop/domain/role.dart';

class User {
  final int id;
  final String login;
  final String password;
  final Role role;

  const User(
      {required this.id,
      required this.login,
      required this.password,
      required this.role});
}
