
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';
import '../models/cart.dart';
import '../models/item.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final cart = (VxState.store as MyStore).cart;
    bool inCart = cart!.items.contains(item);
    return ElevatedButton(
            onPressed: () {
              AddMutation(item.id);
              inCart = true;
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
              Colors.deepPurple,
            )),
            child: (inCart)
                ? const Icon(Icons.done)
                : const Icon(CupertinoIcons.cart_badge_plus))
        .pOnly(right: 8);
  }
}
