import 'package:flutter/material.dart';
import 'package:projectapp/widget/foodlist.dart';
import 'package:projectapp/widget/widget_support.dart';

class Planwidget extends StatelessWidget {
  const Planwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Breakfast Box
        buildMealBox('Breakfast', 'Total Calories: 850 cal', [
          Foodlistcard(),
          Foodlistcard(),
        ]),
        SizedBox(height: 10.0),
        
        // Lunch Box
        buildMealBox('Lunch', 'Total Calories: 850 cal', [
          Foodlistcard(),
        ]),
        SizedBox(height: 10.0),
        
        // Dinner Box
        buildMealBox('Dinner', 'Total Calories: 850 cal', [
          Foodlistcard(),
        ]),
      ],
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
