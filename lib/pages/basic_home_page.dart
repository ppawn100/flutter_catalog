// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/catalog.dart';
import '../widgets/drawer.dart';

class BasicHomePage extends StatefulWidget {
  const BasicHomePage({Key? key}) : super(key: key);

  @override
  State<BasicHomePage> createState() => _BasicHomePageState();
}

class _BasicHomePageState extends State<BasicHomePage> {
  final num days = 30;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((productIem) => Item.fromMap(productIem))
        .toList();
    setState(() {});
    // print(decodedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Catalog")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatalogModel.items.isNotEmpty
            ?
            //ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) =>
            //         ItemWidget(item: CatalogModel.items[index]),
            //   )
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        footer: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Text(
                            item.price.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        child: Image.network(
                          item.image,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      drawer: const MyDrawer(),
    );
  }
}
