import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/food_controller.dart';

class FoodListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
      ),
      body: Consumer<FoodController>(
        builder: (context, foodController, child) {
          return ListView.builder(
            itemCount: foodController.foodItems.length,
            itemBuilder: (context, index) {
              final foodItem = foodController.foodItems[index];
              return ListTile(
                leading: Image.asset(foodItem.imageUrl),
                title: Text(foodItem.name),
                subtitle: Text('\$${foodItem.price}'),
              );
            },
          );
        },
      ),
    );
  }
}