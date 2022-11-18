import 'package:einkaufsliste/infrastructure/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final Function(Product) onPressed;

  const ProductTile(
      {super.key, required this.product, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      onTap: () => onPressed(product),
    );
  }
}
