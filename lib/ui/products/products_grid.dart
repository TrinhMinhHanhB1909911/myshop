import 'package:flutter/material.dart';
import 'package:myshop/ui/products/product_grid_tile.dart';
import 'package:myshop/ui/products/products_manager.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid(this.showFavorite, {Key? key}) : super(key: key);
  final bool showFavorite;
  @override
  Widget build(BuildContext context) {
    final productManager = ProductsManager();
    final products =
        showFavorite ? productManager.favoriteItems : productManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ProductGridTiel(products[index]),
    );
  }
}
