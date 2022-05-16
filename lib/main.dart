import 'package:flutter/material.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
