import 'package:flutter/cupertino.dart';
import 'package:myshop/models/cart_item.dart';
import 'package:myshop/models/product.dart';

class CartManager with ChangeNotifier {
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

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity as num > 1) {
      _items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
