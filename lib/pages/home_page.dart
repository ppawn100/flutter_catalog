import 'package:flutter/material.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final num days = 30;
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(15, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Catalog")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
