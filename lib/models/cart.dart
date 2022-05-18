import 'package:flutter_catalog/core/store.dart';
import 'package:vxstate/vxstate.dart';

import './catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel catalog;

  // collection of Ids -store Ids or each item
  final List<int> _itemIds = [];

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  //Get total price
  num get totalPrice => items.fold(
      0, (previousValue, currentItem) => previousValue + currentItem.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
