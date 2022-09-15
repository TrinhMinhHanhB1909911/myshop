import 'package:flutter/material.dart';
import 'package:myshop/ui/products/product_detail_screen.dart';
import 'package:myshop/ui/products/products_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primaryColorDark: Colors.purple,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: ProductDetailScreen(
          ProductsManager().items[0],
        ),
      ),
    );
  }
}
