import 'package:flutter/material.dart';
import 'package:projectapp/models/NutritionData.dart';
import 'package:projectapp/widget/bonchonEdit_Box.dart';
import 'package:projectapp/widget/widget_support.dart';

class SelfPlanWidgetFR extends StatelessWidget {
  final NutritionData meals;
  final Function(bool) onEditModeChange;
  //final VoidCallback confirmDishCountCallback;

  const SelfPlanWidgetFR({
    Key? key,
    required this.meals,
    required this.onEditModeChange,
    //required this.confirmDishCountCallback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: meals.data.map((meal) {
        // Only show meals with foods
          return Column(
            children: [
              buildMealBox(
                  meal.meal,
                  'Total Calories: ${meal.calories} cal',
                  [
                     BonchonBox(
                      //key: bonchonBoxKey,
                      foodName: meal.name, // Assuming Food class has a 'name' property
                      calories: meal.calories, // Assuming Food class has a 'calories' property
                      dish: meal.dish,
                      imageURL: meal.imageUrl,
                      foodType: const [],
                      onEditModeChange: onEditModeChange,
                      //confirmDishCountCallback: confirmDishCountCallback,
                      foodID: meal.foodID,
                    )]
            ),
              const SizedBox(height: 10.0),
            ],
          );
        return SizedBox.shrink(); // Skip empty meals
      }).toList(),
    );
  }

  // Method to build a meal box
  Widget buildMealBox(
      String mealType, String totalCalories, List<Widget> items) {
    return Container(
      ///////////////////////////////////// Box Widget
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin:
            EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0, bottom: 10.0),
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
