import 'package:velocity_x/velocity_x.dart';
import 'package:untitled/core/store.dart';
import 'package:untitled/models/catalog.dart';

class CartModel {
  //catalog fild
  late CatalogModel _catalog;

  //collection of Ids store Ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total prise
  num get totalPrise =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
