import 'package:untitled/models/catalog.dart';

class CartModel {
  //catalog fild
  CatalogModel _catalog;

  //collection of Ids store Ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get item in the cart
  List<Item> get item => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total prise
  num get totalPrise =>
      items.fold(0, (total, current) => total + current.price);

  //add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
