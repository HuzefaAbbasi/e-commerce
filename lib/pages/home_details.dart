// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:login_project/widgets/addtocart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/item.dart';

class HomeDetails extends StatelessWidget {
  final Item item;
  const HomeDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
       elevation: 0,
        backgroundColor: context.canvasColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                tag: item.id.toString(),
                child: Image.network(item.image).h32(context)),
            Expanded(
              child: VxArc(
                  height: 30,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                    color: context.theme.primaryColorDark,
                    width: context.screenWidth,
                    child: Column(children: [
                      item.name.text.xl3.bold.make(),
                      10.heightBox,
                      item.desc.text.xl2.make(),
                    ]).py64(),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${item.price}"
              .text
              .color(const Color.fromARGB(255, 59, 183, 123))
              .xl3
              
              .make(),
               AddToCartButton(item: item)
        ],
      ).p32().color(context.theme.primaryColorDark),
    );
  }
}
