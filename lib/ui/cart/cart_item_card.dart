import 'package:flutter/material.dart';
import 'package:myshop/models/cart_item.dart';
import 'package:myshop/ui/shared/dialog_utils.dart';
import 'package:provider/provider.dart';

import 'cart_manager.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.productId,
    required this.cartItem,
  }) : super(key: key);
  final String productId;
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showConfirmDialog(
        context,
        'Do you want to remove the item from cart?',
      ),
      onDismissed: (direction) {
        context.read<CartManager>().removeItem(productId);
      },
      child: _buildItemCart(),
    );
  }

  Widget _buildItemCart() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${cartItem.price}'),
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text('Total: ${cartItem.price * cartItem.quantity}'),
          trailing: Text('${cartItem.quantity} x'),
        ),
      ),
    );
  }
}
