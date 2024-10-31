import 'package:flutter/material.dart';
import 'package:projectapp/api/foodrecdetail.dart';
import 'package:projectapp/models/NutritionData.dart';
import 'package:projectapp/widget/exerciseWidget.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/selfplanlistforrecommen.dart';

import 'package:projectapp/widget/widget_support.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectapp/api/mealplanPage.dart';
import 'package:projectapp/models/mealplanPage.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_share.dart';
import 'package:projectapp/widget/exerciseWidget.dart';

import 'package:projectapp/widget/bonchonEdit_Box.dart';

import 'package:http/http.dart' as http;

class FoodRecommendationPlanDetail extends StatefulWidget {
  final String plannerID;
  final GlobalKey<BonchonBoxState> bonchonBoxKey = GlobalKey<BonchonBoxState>();

  FoodRecommendationPlanDetail({
    Key? key, // Include 'Key? key' to properly inherit the StatefulWidget's key
    required this.plannerID,
  }) : super(key: key);

  @override
  State<FoodRecommendationPlanDetail> createState() =>
      _FoodRecommendationPlanDetailState();
}

class _FoodRecommendationPlanDetailState
    extends State<FoodRecommendationPlanDetail> {
  bool isLoading = true;
  late NutritionData mealData; // Declare `mealData` specific to this state
  int _selectedIndex = 0;

  bool isEditModeActive = false;

  void toggleConfirmButton(bool isActive) {
    setState(() {
      isEditModeActive = isActive;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchdata(widget.plannerID);
  }

  Future<void> fetchdata(String plannerID) async {
    try {
      mealData =
          await PlanAppRecommendDetailService.getFoodRecommendationDetail(
              plannerID);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching planners: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 214, 181),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 60,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconBack(),
                                Text(
                                  'Food Recommendation',
                                  style: AppWidget.boldTextFeildStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 7.6,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 660,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55),
                          topRight: Radius.circular(55),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Fats',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: const Color.fromRGBO(
                                            137, 132, 132, 1),
                                      ),
                                    ),
                                    Text(
                                      '${mealData?.message.fat}g',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      'Carb.',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: const Color.fromRGBO(
                                            137, 132, 132, 1),
                                      ),
                                    ),
                                    Text(
                                      '${mealData?.message.carb}g',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      'Proteins',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: const Color.fromRGBO(
                                            137, 132, 132, 1),
                                      ),
                                    ),
                                    Text(
                                      '${mealData?.message.protein}g',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      'Calories',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(137, 132, 132, 1),
                                      ),
                                    ),
                                    Text(
                                      '${mealData?.message.calories}kcal',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_today_outlined),
                                Text(' date ',
                                    style: AppWidget.dateboldTextFeildStyle()),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: PlanPage(
                                data: mealData,
                                onEditModeChange: toggleConfirmButton,
                              ), // Pass the meals here //CustomNavBar(onItemTapped: _onItemTapped),
                            ),
                            SizedBox(height: 10.0),
                            // Display the selected page

                            //_pages[_selectedIndex],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (isEditModeActive)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFFFFFFF)),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFEF3B4F)),
                              shape: WidgetStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Change button border radius
                                ),
                              ),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              print('Confirm button clicked');
                              widget.bonchonBoxKey.currentState
                                  ?.confirmDishCount();
                              widget.bonchonBoxKey.currentState
                                  ?.toggleEditMode();
                              setState(() {
                                isEditModeActive = !isEditModeActive;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFF4F6C4E)),
                              foregroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white),
                              shape: WidgetStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Change button border radius
                                ),
                              ),
                            ),
                            child: const Text('Confirm Changed'),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
    );
  }
}

class CustomNavBar extends StatefulWidget {
  final Function(int) onItemTapped;

  const CustomNavBar({super.key, required this.onItemTapped});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(index); // แจ้ง StatefulWidget ว่ามีการเปลี่ยนแปลง index
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('Plan', 0),
          _buildNavItem('Exercise', 1),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 240, 214, 181)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index
                ? Colors.black
                : const Color.fromARGB(255, 117, 117, 117),
            fontWeight:
                _selectedIndex == index ? FontWeight.bold : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PlanPage extends StatelessWidget {
  final NutritionData data; // Store meals as a property
  final Function(bool) onEditModeChange;
  //final VoidCallback confirmDishCountCallback;

  const PlanPage({
    super.key,
    required this.data,
    required this.onEditModeChange,
    //required this.confirmDishCountCallback,
  }); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return SelfPlanWidgetFR(
      meals: data,
      onEditModeChange: onEditModeChange,
      //confirmDishCountCallback: confirmDishCountCallback,
    ); // Pass meals to SelfPlanWidget
  }
}

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Exercisewidget();
  }
}
