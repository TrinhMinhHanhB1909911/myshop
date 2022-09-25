import 'package:myshop/models/cart_item.dart';

class CartManager {
  final Map<String, CartItem> _items = <String, CartItem>{
    'p1': CartItem(
      id: 'c1',
      title: 'Red shirt',
      quantity: 2,
      price: 29.99,
    ),
  };

  int get productCount => _items.length;

  List<CartItem> get products => _items.values.toList();

  Iterable<MapEntry<String, CartItem>> get productEntries =>
      {..._items}.entries;

  double get totalAmount =>
      _items.values.fold(0.0, (total, item) => total + item.price);
}
