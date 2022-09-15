import '../../models/product.dart';

class ProductsManager {
  final List<Product> _items = <Product>[];

  int get itemCounts => _items.length;

  List<Product> get items => _items;

  List<Product> get favoriteItems => _items.where((item) => item.isFavorite).toList();
}
