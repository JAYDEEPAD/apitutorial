import 'package:apitutorial/Models/Fruit.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final Fruit fruit;
  int quantity;

  CartItem({required this.fruit, this.quantity = 1});

  double get totalPrice => fruit.price * quantity;
}

class CartState extends ChangeNotifier {
  final Map<String, CartItem> _itemsById = {};

  List<CartItem> get items => _itemsById.values.toList(growable: false);

  double get total => _itemsById.values
      .fold(0.0, (previousValue, item) => previousValue + item.totalPrice);

  int get totalQuantity => _itemsById.values
      .fold(0, (previousValue, item) => previousValue + item.quantity);

  void add(Fruit fruit) {
    final existing = _itemsById[fruit.id];
    if (existing != null) {
      existing.quantity += 1;
    } else {
      _itemsById[fruit.id] = CartItem(fruit: fruit, quantity: 1);
    }
    notifyListeners();
  }

  void removeOne(Fruit fruit) {
    final existing = _itemsById[fruit.id];
    if (existing == null) return;
    if (existing.quantity > 1) {
      existing.quantity -= 1;
    } else {
      _itemsById.remove(fruit.id);
    }
    notifyListeners();
  }

  void removeAll(Fruit fruit) {
    _itemsById.remove(fruit.id);
    notifyListeners();
  }

  void clear() {
    _itemsById.clear();
    notifyListeners();
  }
}
