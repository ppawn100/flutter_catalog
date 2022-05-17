import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import './pages/home_page.dart';
import './pages/login_page.dart';
import './utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeData,
      darkTheme: MyTheme.darkThemeData,
      initialRoute: AppRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
