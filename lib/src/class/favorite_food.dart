import 'package:my_app/src/models/foods.dart';

class FavoriteItem {
  static late List<Food> favoriteFood = [];

  void addfood({
    required Food newfood,
  }) {
    favoriteFood.add(newfood);
  }

  void deletet(Food food) {
    favoriteFood.removeWhere((element) {
      return element == food;
    });
  }

  void clear() {
    favoriteFood.clear();
  }
}
