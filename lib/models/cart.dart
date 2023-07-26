import 'package:login_project/core/store.dart';
import 'package:login_project/models/item.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart {
  CatalogModel? _catalog;

  //List of all item ids in cart
  final List<int> _itemsIds = [];

  //Getter for catalog
  CatalogModel? get catalog => _catalog;
  //Setter for catalog
  set catalog(CatalogModel? catalog) => _catalog = catalog;

  List<Item> get items {
    // Use null-aware operator (?) to check if _catalog is not null
    return _itemsIds
        .map((id) => _catalog?.getItemById(id)) // map can return null values
        .whereType<Item>() // Filter out null values
        .toList(); // Convert Iterable<Item> to List<Item>
  }

  //num type: for both int and double
  //Method to get total price
  num getTotalPrice() =>
      items.fold(0, (total, element) => total + element.price);
}

class AddMutation extends VxMutation<MyStore> {
  final int id;
  AddMutation(this.id);
  Cart? _cart;
  @override
  perform() {
    _cart = store!.cart;
    _cart!._itemsIds.add(id);
    store!.cart = _cart;
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final int id;
  RemoveMutation(this.id);

  @override
  perform() {
    store!.cart!._itemsIds.remove(id);
  }
}
