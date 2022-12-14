import 'package:flutter/material.dart';
import 'package:myshop/ui/order/order_item_card.dart';
import 'package:myshop/ui/order/order_manager.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const String routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    print('building order');
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Your order'),
      ),
      body: Consumer<OrderManager>(
        builder: (context, orderManager, child) {
          return ListView.builder(
            itemCount: orderManager.orderCount,
            itemBuilder: (context, index) {
              return OrderItemCard(orderManager.orders[index]);
            },
          );
        },
      ),
    );
  }
}
