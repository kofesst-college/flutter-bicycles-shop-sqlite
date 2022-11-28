import 'package:bicycles_shop/core/db/database_helper.dart';
import 'package:bicycles_shop/domain/user.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<StatefulWidget> createState() {
    return AuthViewState();
  }
}

class AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  Future<User?> _onAuthClick() async {
    final login = _loginController.text;
    final password = _passwordController.text;
    return await DatabaseHelper().signIn(login, password);
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
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Это обязательное поле';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _onAuthClick().then((user) => {
                                  if (user == null)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Неправильные данные для входа')),
                                      )
                                    }
                                  else
                                    {
                                      Navigator.of(context)
                                          .pushReplacementNamed(user.role.name)
                                    }
                                });
                          }
                        },
                        child: const Text('Войти в профиль'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed("register");
                        },
                        child: const Text('Нет у меня профиля!!!'),
                      ),
                    ])))));
  }
}
