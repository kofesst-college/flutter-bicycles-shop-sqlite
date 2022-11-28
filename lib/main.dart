import 'package:bicycles_shop/core/db/database_helper.dart';
import 'package:bicycles_shop/views/admin_view.dart';
import 'package:bicycles_shop/views/auth.dart';
import 'package:bicycles_shop/views/cashier_view.dart';
import 'package:bicycles_shop/views/customer_view.dart';
import 'package:bicycles_shop/views/register.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().init();
  runApp(const BicyclesShopApp());
}

class BicyclesShopApp extends StatelessWidget {
  const BicyclesShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bicycles Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "auth": (context) => const AuthView(),
          "register": (context) => const RegisterView(),
          "admin": (context) => const AdminView(),
          "cashier": (context) => const CashierView(),
          "customer": (context) => const CustomerView(),
        },
        initialRoute: "auth");
  }
}
