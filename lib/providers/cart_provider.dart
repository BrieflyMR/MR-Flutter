import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(String name, double price) {
    final index = _items.indexWhere((item) => item.name == name);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(name: name, price: price));
    }
    notifyListeners();
    debugPrint('Item added: $name, Total items: ${_items.length}');
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item.name == name);
    notifyListeners();
    debugPrint('Item removed: $name');
  }

  void clear() {
    _items.clear();
    notifyListeners();
    debugPrint('Cart cleared');
  }

  void increaseQuantity(String name) {
    final index = _items.indexWhere((item) => item.name == name);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
      debugPrint('Quantity increased for: $name');
    }
  }

  void decreaseQuantity(String name) {
    final index = _items.indexWhere((item) => item.name == name);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
      debugPrint('Quantity decreased for: $name');
    }
  }
}