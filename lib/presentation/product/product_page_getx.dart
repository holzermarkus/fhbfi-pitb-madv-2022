import 'package:einkaufsliste/infrastructure/product.dart';
import 'package:einkaufsliste/infrastructure/product_repository.dart';
import 'package:flutter/material.dart';

import 'product_tile.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  final availableProducts = <Product>[].obs;
  final selectedProducts = <Product>[].obs;

  int get availableProductsCount => availableProducts.length;
  int get selectedProductsCount => selectedProducts.length;

  Product availableProductsIndex(index){
    return availableProducts[index];
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productRepository = ProductRepository();
  final Controller c = Get.put(Controller());

  @override
  void initState() {
    super.initState();

    productRepository.findAll().then((products) => {
      c.availableProducts.addAll(products)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produkte'),
      ),
      body: _buildProductList(),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: _onCartButtonPressed,
      child: Row(
        children: [
          Obx(() => Text("${c.selectedProducts.length}")),
          const Icon(Icons.shopping_basket)
        ],
      ),
    );
  }

  void _onCartButtonPressed() {
    for (var element in c.selectedProducts) {
      c.availableProducts.add(element);
      c.selectedProducts.clear();
    }
  }


  Widget _buildProductList() {
    return ListView.builder(
        itemBuilder: (context, index) => ProductTile(
          product: c.availableProductsIndex(index),
          onPressed: (product) => _onProductSelected(product),
        ),
        itemCount: c.availableProductsCount);
  }

  void _onProductSelected(Product product) {
    c.selectedProducts.add(product);
    c.availableProducts.remove(product);
  }
}