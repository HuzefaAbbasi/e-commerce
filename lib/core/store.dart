import 'package:login_project/models/cart.dart';
import 'package:login_project/models/item.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel? model;
  Cart? _cart;
  // Getter for cart
  Cart? get cart => _cart;

  // Setter for cart (if needed)
  set cart(Cart? cart) {
    _cart = cart;
    // Perform any additional actions when the cart is updated, if needed.
  }
  MyStore() {
    model =  CatalogModel();
    cart =  Cart();
    cart!.catalog = model;
  }
  
}
