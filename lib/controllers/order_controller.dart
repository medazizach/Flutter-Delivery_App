import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/food_item.dart';

class OrderController with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void placeOrder(List<FoodItem> items) {
    final newOrder = Order(
      id: DateTime.now().toString(),
      items: items,
      totalPrice: items.fold(0.0, (sum, item) => sum + item.price),
    );
    _orders.add(newOrder);
    notifyListeners();
  }
}