import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.receipt_long),
          title: Text('Order #${1000 + index}'),
          subtitle: const Text('Delivered'),
          trailing: const Text('\$16.70'),
        ),
        separatorBuilder: (_, __) => const Divider(height: 1),
      ),
    );
  }
}
