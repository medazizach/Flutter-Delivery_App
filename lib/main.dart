import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/food_controller.dart';
import 'controllers/order_controller.dart';
import 'views/food_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodController()),
        ChangeNotifierProvider(create: (_) => OrderController()),
      ],
      child: MaterialApp(
        title: 'Food Delivery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FoodListView(),
      ),
    );
  }
}

class FoodListView extends StatelessWidget {
  const FoodListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<FoodController>(
              builder: (context, foodController, child) {
                return ListView.builder(
                  shrinkWrap: true,
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
            Consumer<OrderController>(
              builder: (context, orderController, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderController.orders.length,
                  itemBuilder: (context, index) {
                    final order = orderController.orders[index];
                    return ListTile(
                      title: Text('Order ${order.id}'),
                      subtitle: Text('Total: \$${order.totalPrice}'),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
