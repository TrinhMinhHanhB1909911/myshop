import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:myshop/ui/products/user_product_list_tile.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productManager = ProductsManager();
    return Scaffold(
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
    return ListView.builder(
      itemCount: productsManager.itemCounts,
      itemBuilder: (context, index) {
        return Column(
          children: [
            UserProductListTile(productsManager.items[index]),
            const Divider(),
          ],
        );
      },
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
