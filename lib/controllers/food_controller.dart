import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodController with ChangeNotifier {
  List<FoodItem> _foodItems = [
    FoodItem(id: '1', name: 'Pizza', price: 9.99, imageUrl: 'assets/pizza.png'),
    FoodItem(id: '2', name: 'Burger', price: 5.99, imageUrl: 'assets/burger.png'),
  ];

  List<FoodItem> get foodItems => _foodItems;

  void addFoodItem(FoodItem item) {
    _foodItems.add(item);
    notifyListeners();
  }
}