import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final num days = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Catalog")),
      body: Center(
        child: Container(
          child: Text(
            "Welcome to $days days of flutter",
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
