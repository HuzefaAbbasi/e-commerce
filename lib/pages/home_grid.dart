import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_project/models/item.dart';

import '../widgets/drawer.dart';

class HomePageGrid extends StatefulWidget {
  const HomePageGrid({super.key});
  @override
  State<HomePageGrid> createState() => _HomePageGridState();
}

class _HomePageGridState extends State<HomePageGrid> {
  static List<Item>? list;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonData = await rootBundle.loadString("assets/files/items.json");
    final decodedData = jsonDecode(jsonData);
    var productsData = decodedData["products"];
    //To make list from json data
    list = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Catalog"),
        elevation: 1,
      ),
      body: (list != null && list!.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: list!.length,
                itemBuilder: (context, index) => makeItem(list![index]),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
    );
  }

  // To make one item
  makeItem(Item item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          //if border not rendering fine.
          clipBehavior: Clip.antiAlias,
          child: GridTile(
            header: Text(item.name),
            footer: Text(
              '${item.price} \$',
              style: const TextStyle(color: Colors.deepPurple),
              textScaleFactor: 1.5,
            ),
            child: Image.network(item.image),
            // leading: Image.network(item.image),
            // title: Text(item.name),
            // subtitle: Text(item.desc),
            // trailing: Text(
            //   '${item.price} \$',
            //   style: const TextStyle(color: Colors.deepPurple),
            //   textScaleFactor: 1.5,
            // ),
          )),
    );
  }
}
