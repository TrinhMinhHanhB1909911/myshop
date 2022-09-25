import 'package:flutter/cupertino.dart';
import 'package:myshop/models/cart_item.dart';
import 'package:myshop/models/order_item.dart';

class OrderManager with ChangeNotifier {
  final List<OrderItem> _orders = [
    OrderItem(
      id: 'o1',
      amount: 59.98,
      products: [
        CartItem(
          id: 'c1',
          title: 'Red shirt',
          quantity: 2,
          price: 29.99,
        ),
      ],
      dateTime: DateTime.now(),
    ),
  ];

  int get orderCount => _orders.length;

  List<OrderItem> get orders => _orders;
}
