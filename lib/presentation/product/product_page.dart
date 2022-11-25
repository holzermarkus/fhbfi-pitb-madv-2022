import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_page_controller.dart';
import 'product_tile.dart';

class ProductPage extends GetView<ProductPageController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produkte'),
      ),
      body: _buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.cleanCart(),
        child: Row(
          children: [
            Obx(() => Text('  ${controller.selectedProducts.length}')),
            const Icon(Icons.shopping_bag),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Obx(
      () => ListView.builder(
        itemBuilder: (context, index) => ProductTile(
          product: controller.availableProducts[index],
        ),
        itemCount: controller.availableProducts.length,
      ),
    );
  }
}
