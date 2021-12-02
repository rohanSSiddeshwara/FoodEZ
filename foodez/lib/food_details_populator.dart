class food_details{
  final String name;
  final double price;
  final String details;
  final int image_num;

  food_details({required this.name,
  required this.price,
  required this.details,
  required this.image_num});
}

class canteen_details{
  final String name;
  final int image_num;
  canteen_details({required this.name,required this.image_num});
}

class cart_elements{
  final String name;
  final double Price;
  final double total_price;
  final int image_number;
  cart_elements({required this.name,required this.Price,required this.total_price,required this.image_number});
}