import 'dart:math';

import 'package:bicycles_shop/core/db/database_helper.dart';
import 'package:bicycles_shop/domain/role.dart';
import 'package:bicycles_shop/domain/user.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterViewState();
  }
}

class RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  Future<User?> _onRegisterClick() async {
    final login = _loginController.text;
    final password = _passwordController.text;
    final role = Role.values[Random().nextInt(Role.values.length)];
    return await DatabaseHelper().signUp(login, password, role);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: _loginController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Это обязательное поле';
                          }
                          if (value.length < 5 || value.length > 30) {
                            return 'Длина должна быть от 5 до 30 символов';
                          }
                          if (RegExp(r'^[a-zA-Z0-9]+$')
                              .allMatches(value)
                              .isEmpty) {
                            return "Логин должен содержать только латинские буквы и цифры";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Это обязательное поле';
                          }
                          if (value.length < 5 || value.length > 30) {
                            return 'Длина должна быть от 5 до 30 символов';
                          }
                          if (RegExp(r'^[a-zA-Z0-9]+$')
                              .allMatches(value)
                              .isEmpty) {
                            return "Пароль должен содержать только латинские буквы и цифры";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _onRegisterClick().then((result) => {
                                  if (result == null)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Логин занят')),
                                      )
                                    }
                                  else
                                    {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              result.role.name)
                                    }
                                });
                          }
                        },
                        child: const Text('Зарегистрироваться'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("auth");
                        },
                        child: const Text('Уже есть профиль?'),
                      ),
                    ])))));
  }
}
