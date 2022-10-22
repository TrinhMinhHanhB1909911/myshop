import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:myshop/ui/products/user_product_list_tile.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  static const String routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productManager = ProductsManager();
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Your product'),
        actions: [
          buildAddButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh product'),
        child: buildUserProductListView(productManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productsManager) {
    return Consumer<ProductsManager>(
      builder: (context, value, child) {
        return child!;
      },
      child: ListView.builder(
        itemCount: productsManager.itemCounts,
        itemBuilder: (context, index) {
          return Column(
            children: [
              UserProductListTile(productsManager.items[index]),
              const Divider(),
            ],
          );
        },
      ),
    );
  }

  Widget buildAddButton() {
    return IconButton(
      onPressed: () {
        print('go to edit product screen');
      },
      icon: const Icon(Icons.add),
    );
  }
}
