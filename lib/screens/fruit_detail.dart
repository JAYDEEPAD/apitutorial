import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Fruit.dart';
import '../state/cart_state.dart';

class FruitDetailScreen extends StatelessWidget {
  const FruitDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Fruit fruit = ModalRoute.of(context)!.settings.arguments as Fruit;
    return Scaffold(
      appBar: AppBar(title: Text(fruit.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(fruit.imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fruit.name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(fruit.description),
                const SizedBox(height: 16),
                Text(
                  '\$' + fruit.price.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.read<CartState>().add(fruit),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
