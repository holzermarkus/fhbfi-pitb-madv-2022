import 'package:einkaufsliste/infrastructure/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_page_controller.dart';

class ProductTile extends GetView<ProductPageController> {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.categoryName),
      onTap: () => controller.addProductToCart(product),
    );
  }
}
