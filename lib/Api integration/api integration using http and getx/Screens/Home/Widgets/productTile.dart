import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Api%20integration/api%20integration%20using%20http%20and%20getx/model/ProductModel.dart';


class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: CachedNetworkImage(
            imageUrl: product.image!,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          product.title!,
          maxLines: 2,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text("${product.rating?.rate!}")
      ],
    ));
  }
}
