import 'package:flutter/material.dart';
import 'package:projectapp/models/mealplanPage.dart';
import 'package:projectapp/widget/bonchonEdit_Box.dart';
import 'package:projectapp/widget/widget_support.dart';

class SelfPlanWidget extends StatelessWidget {
  final List<Meal> meals;
  const SelfPlanWidget({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: meals.map((meal) {
        // Only show meals with foods
        if (meal.foods.isNotEmpty) {
          return Column(
            children: [
              buildMealBox(meal.meal, 'Total Calories: ${meal.totalCalories} cal', 
              meal.foods.map((food) {
                List<String> filteredTags = Food.fromJson(food.toJson()).toJson()['tags'];
                  return BonchonBox(
                    foodName: food.name, // Assuming Food class has a 'name' property
                    calories: food.calories, // Assuming Food class has a 'calories' property
                    dish: food.dish,
                    imageURL: food.imageURL,
                    foodType: filteredTags,
                  );
                }).toList()
              ),
              const SizedBox(height: 10.0),
            ],
          );
        }
        return SizedBox.shrink(); // Skip empty meals
      }).toList(),
    );
  }

  // Method to build a meal box
  Widget buildMealBox(String mealType, String totalCalories, List<Widget> items) {
    return Container(
      ///////////////////////////////////// Box Widget
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0, bottom: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(mealType, style: AppWidget.dateboldTextFeildStyle()),
                Text(totalCalories, style: AppWidget.totalcalTextFeildStyle()),
              ],
            ),
            SizedBox(height: 10.0),
            Column(children: items), // Add meal items here
          ],
        ),
      ),
    );
  }
}