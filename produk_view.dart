import 'package:coba/models/produk.dart';
import 'package:flutter/material.dart';

class MyProduct extends StatelessWidget {
  const MyProduct({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.nama),
        centerTitle: true,
      ),
      body: Column(children: [
        Hero(
          tag: product.image,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(product.image))),
          ),
        ),
        ListTile(
          title: Text(product.price.toString()),
        ),
        ListTile(
          title: Text(product.quantity.toString()),
        ),
      ]),
    );
  }
}
