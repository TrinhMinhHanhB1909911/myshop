import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:myshop/ui/products/user_product_list_tile.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';

import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  static const String routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productManager = context.read<ProductsManager>();
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Your product'),
        actions: [
          buildAddButton(context),
        ],
      ),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            child: buildUserProductListView(productManager),
            onRefresh: () => _refreshProducts(context),
          );
        },
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productsManager) {
    return Consumer<ProductsManager>(
      builder: (context, productsManager, child) {
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
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
        );
      },
      icon: const Icon(Icons.add),
    );
  }
}
