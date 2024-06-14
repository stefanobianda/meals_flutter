import 'package:meals/models/meal.dart';

class MealExtended {
  MealExtended({
    required this.meal,
    this.isFavorite = true,
  });

  final Meal meal;
  bool isFavorite;
}
