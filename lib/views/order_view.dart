import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/order_controller.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: Consumer<OrderController>(
        builder: (context, orderController, child) {
          return ListView.builder(
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
    );
  }
}