import 'package:get/get.dart';

import '../../infrastructure/product.dart';
import '../../infrastructure/product_repository.dart';

class ProductPageController extends GetxController {
  var productRepository = Get.find<ProductRepository>();

  var availableProducts = <Product>[].obs;
  var selectedProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() {
    productRepository.findAll().then((products) {
      availableProducts.addAll(products);
    });
  }

  void addProductToCart(Product product) {
    availableProducts.remove(product);
    selectedProducts.add(product);
  }

  void cleanCart() {
    selectedProducts.clear();
    availableProducts.clear();
    _initData();
  }
}
