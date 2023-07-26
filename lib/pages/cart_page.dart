// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:login_project/core/store.dart';

import '../models/cart.dart';
import '../models/item.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.canvasColor,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(child: "Cart".text.bold.xl4.make()),
        const SizedBox(
          height: 30,
        ),
        (_cart!.items.isNotEmpty)
            ? Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: _cart!.items.length,
                        itemBuilder: (context, index) =>
                            ListItem(item: _cart!.items[index])),
                           
                  ),
                   const Divider(),
                   Total(price: _cart!.getTotalPrice()),
              ],
            ).expand()
            : "Nothing to Show".text.xl2.make(),
        
      ]),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.done),
        title: item.name.text.bold.make(),
        trailing: IconButton(
          onPressed: () => RemoveMutation(item.id),
          icon: const Icon(CupertinoIcons.minus_circle),
        ));
  }
}

class Total extends StatelessWidget {
  const Total({
    Key? key,
    required this.price,
  }) : super(key: key);
  final num price;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            '\$$price'.text.xl4.color(const Color.fromARGB(255, 59, 183, 123)).make(),
            ElevatedButton(
               style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
              Colors.deepPurple,
            )),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: 'Billing not Supported Yet'.text.xl.make()));
                },
                child: 'Check out'.text.xl2.make()
                )
          ],
        ));
  }
}
