import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infrastructure/product_repository.dart';
import 'product/product_page.dart';
import 'product/product_page_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductPageController());
    Get.lazyPut(() => ProductRepository());

    return const GetMaterialApp(
      title: 'Einkaufsliste',
      home: ProductPage(),
    );
  }
}
