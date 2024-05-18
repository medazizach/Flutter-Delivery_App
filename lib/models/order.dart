class Order {
  final String id;
  final List<FoodItem> items;
  final double totalPrice;

  Order({required this.id, required this.items, required this.totalPrice});
}