import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/ui/products/product_detail_screen.dart';

class ProductGridTiel extends StatelessWidget {
  const ProductGridTiel(this.product, {Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: ValueListenableBuilder<bool>(
        valueListenable: product.isFavoriteListenable,
        builder: (context, isFavorite, child) {
          return IconButton(
            onPressed: () {
              product.isFavorite = !product.isFavorite;
            },
            color: Theme.of(context).colorScheme.secondary,
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
          );
        },
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          print('Add an item to caort');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
