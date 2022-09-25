import 'package:flutter/material.dart';
import 'package:myshop/ui/order/order_item_card.dart';
import 'package:myshop/ui/order/order_manager.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building order');
    final orderManager = OrderManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your order'),
      ),
      body: ListView.builder(
        itemCount: orderManager.orderCount,
        itemBuilder: (context, index) {
          return OrderItemCard(orderManager.orders[index]);
        },
      ),
    );
  }
}
