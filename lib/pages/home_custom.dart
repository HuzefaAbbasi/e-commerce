// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:login_project/models/cart.dart';
import 'package:login_project/models/item.dart';
import 'package:login_project/pages/home_details.dart';
import 'package:login_project/utils/myroutes.dart';

import '../core/store.dart';
import '../widgets/addtocart.dart';
import '../widgets/drawer.dart';

class HomeCustom extends StatefulWidget {
  const HomeCustom({super.key});
  @override
  State<HomeCustom> createState() => _HomeCustomState();
}

class _HomeCustomState extends State<HomeCustom> {
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
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.primaryColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageHeader(),
                (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                    ? ProductsList(
                        list: CatalogModel.items,
                      ).expand()
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ),
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder :(context,_ , __)=> FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: Colors.deepPurple,
            child: const Icon(CupertinoIcons.cart, color: Colors.white,),
          ).
          badge(
            optionalWidget: '${cart!.items.length}'.text.color(Colors.white).make(),
            color: Colors.red,
            size: 20
            ),
        )
        );
  }
}

class ProductsList extends StatelessWidget {
  final List<Item>? list;
  const ProductsList({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list!.length,
      itemBuilder: (context, index) => makeItem(list![index], context),
    );
  }

  // To make one item
  makeItem(Item item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => HomeDetails(
                      item: item,
                    )))),
        child: Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            //if border not rendering fine.
            clipBehavior: Clip.antiAlias,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: item.id.toString(),
                  child: Image.network(item.image).box.p20.make(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      10.heightBox,
                      item.name.text.xl.bold.make(),
                      item.desc.text.make(),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "\$ ${item.price}".text.xl.bold.make(),
                          AddToCartButton(item: item),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ).box.height(150).make()),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.make(),
        "Trending Products".text.xl2.make(),
        10.heightBox
      ],
    );
  }
}
