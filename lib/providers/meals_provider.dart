import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/data/dummy_data.dart';

import '../models/meal.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});

final mealsNotifier = StateNotifierProvider((ref) => MealsListNotifier(dummyMeals));

class MealsListNotifier extends StateNotifier<List<Meal>> {
  MealsListNotifier(List<Meal> state) : super(state);

  void addMeal(Meal meal) {
    state = [...state, meal];
  }
}