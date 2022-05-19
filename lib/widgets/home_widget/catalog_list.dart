// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '../../models/catalog.dart';
import './catalog_image.dart';
import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomeDetailPage(
              //       catalog: catalog,
              //     ),
              //   ),
              // );
              // context.vxNav.push(
              //   Uri(
              //       path: AppRoutes.homeDetailRoute,
              //       queryParameters: {"id": catalog.id.toString()}),
              // );
              (VxState.store as MyStore).navigator.routeManager.push(Uri(
                  path: AppRoutes.homeDetailRoute,
                  queryParameters: {"id": catalog.id.toString()}));
            },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(context.theme.secondaryHeaderColor)
                    .bold
                    .make(),
                catalog.desc.text
                    .textStyle(const TextStyle(color: Colors.grey))
                    .make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.make(),
                    AddToCart(catalog: catalog)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
