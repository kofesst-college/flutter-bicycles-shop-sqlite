import 'package:bicycles_shop/domain/role.dart';
import 'package:bicycles_shop/domain/user.dart';

class UserEntity {
  final int id;
  final String login;
  final String password;
  final Role role;

  const UserEntity(
      {required this.id,
      required this.login,
      required this.password,
      required this.role});

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
        id: map['id'],
        login: map['login'],
        password: map['password'],
        role: Role.values[map['role']]);
  }

  User toUser() {
    return User(id: id, login: login, password: password, role: role);
  }
}
