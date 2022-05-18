import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import './pages/home_page.dart';
import './pages/login_page.dart';
import '../pages/cart_page.dart';
import './utils/routes.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: AppRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
