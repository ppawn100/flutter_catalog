import './catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalogModel;

  // collection of Ids -store Ids or each item
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalogModel;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalogModel = newCatalog;
  }

  //Get items in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).toList();

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
