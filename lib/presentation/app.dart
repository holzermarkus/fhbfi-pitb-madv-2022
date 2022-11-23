import 'package:flutter/material.dart';
import 'product/product_page_getx.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Einkaufsliste',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ProductPage(),
    );
  }
}
