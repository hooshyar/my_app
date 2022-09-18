import 'package:my_app/src/models/food_order.dart';
import 'package:my_app/src/models/foods.dart';

class FoodInCart {
  // ignore: non_constant_identifier_names
  static late List<FoodOrder>? food_list_order = [];
  static double total = 0;

  void deletet(String thename, double price, int count) {
    food_list_order!.removeWhere((element) {
      return element.food.name == thename;
    });
    total = total - (price * count);
    print(total);
  }

  void clear() {
    food_list_order!.clear();
    total = 0.0;
    print(total);
  }

  void addfood({
    required Food newfood,
    required int count,
  }) {
    FoodOrder foodOrder = FoodOrder(food: newfood, count: count);

    food_list_order!.add(foodOrder);
    total = total + (newfood.price * count);
    print(food_list_order.toString());
    print(total);
  }
}
