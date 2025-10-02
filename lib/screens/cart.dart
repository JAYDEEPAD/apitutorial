import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Consumer<CartState>(
        builder: (context, cart, _) {
          if (cart.items.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: cart.items.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.fruit.imageUrl),
                      ),
                      title: Text(item.fruit.name),
                      subtitle: Text('\$' + item.fruit.price.toStringAsFixed(2)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () => cart.removeOne(item.fruit),
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => cart.add(item.fruit),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$' + cart.total.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/checkout'),
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
