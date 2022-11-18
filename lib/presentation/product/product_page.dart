import 'package:einkaufsliste/infrastructure/product.dart';
import 'package:einkaufsliste/infrastructure/product_repository.dart';
import 'package:flutter/material.dart';

import 'product_tile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productRepository = ProductRepository();
  List<Product> _availableProducts = [];
  final List<Product> _selectedProducts = [];

  @override
  void initState() {
    super.initState();

    productRepository.findAll().then((products) => {
          setState(() => {_availableProducts = products})
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
          Text('  ${_selectedProducts.length} '),
          const Icon(Icons.shopping_basket)
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
        itemBuilder: (context, index) => ProductTile(
              product: _availableProducts[index],
              onPressed: (product) => _onProductSelected(product),
            ),
        itemCount: _availableProducts.length);
  }

  void _onCartButtonPressed() {
    productRepository.findAll().then((products) => {
          setState(
            () {
              _selectedProducts.clear();
              _availableProducts = products;
            },
          )
        });
  }

  void _onProductSelected(Product product) {
    setState(() {
      _selectedProducts.add(product);
      _availableProducts.remove(product);
    });
  }
}
