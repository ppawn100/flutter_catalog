// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/catalog.dart';
import '../widgets/home_widget/catalog_header.dart';
import '../widgets/home_widget/catalog_list.dart';

// import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response =
    //     await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    // var responseData = response.body;

    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((productIem) => Item.fromMap(productIem))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.cartRoute);
          },
          backgroundColor: context.backgroundColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: Vx.red500,
          size: 22,
          count: cart.items.length,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
