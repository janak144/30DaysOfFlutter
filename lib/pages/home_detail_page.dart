// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widgets/home_widgets/add_to_cart.dart';
import 'package:untitled/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item Catalog;
  const HomeDetailPage({
    Key? key,
    required this.Catalog,
  })  : assert(Catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${Catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: Catalog,
            ).wh(120, 40)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(Catalog.id.toString()),
              child: Image.network(Catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    Catalog.name.text.xl4.bold
                        .color(context.accentColor)
                        .make(),
                    Catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "The only available way to support Team-FTU is by the clicking ads on websites whenever you visit, this will help Team-FTU to keep community based websites alive and working."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
