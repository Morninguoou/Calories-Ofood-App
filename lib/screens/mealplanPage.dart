import 'package:flutter/material.dart';
import 'package:projectapp/api/mealplanPage.dart';
import 'package:projectapp/models/mealplanPage.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/selfplanWidget.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_share.dart';
import 'package:projectapp/widget/exerciseWidget.dart';

class MealPlan extends StatefulWidget {
  final String planName;
  final String plannerID;
  final String formattedDate;
  const MealPlan({
    Key? key, // Include 'Key? key' to properly inherit the StatefulWidget's key
    required this.plannerID,
    required this.planName,
    required this.formattedDate,
  }) : super(key: key);

  @override
  State<MealPlan> createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  bool isLoading = true;
  MealPlanModel? mealData; // Declare `mealData` specific to this state
  int _selectedIndex = 0;

  // final List<Widget> _pages = [
  //   const PlanPage(),
  //   //const ExercisePage(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPlanners(widget.plannerID);
  }

  Future<void> fetchPlanners(String plannerID) async {
    try {
      mealData = await MealPlanService.getPlannersByPlanID(plannerID);
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
                  margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconBack(),
                          Text(
                            ' ${widget.planName}',
                            style: AppWidget.headlineTextFeildStyle()
                                .copyWith(fontSize: 36),
                          ),
                        ],
                      ),
                      IconShare(),
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
                                  color: const Color.fromRGBO(137, 132, 132, 1),
                                ),
                              ),
                              Text(
                                '${mealData?.totalAllFat}g',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
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
                                  color: const Color.fromRGBO(137, 132, 132, 1),
                                ),
                              ),
                              Text(
                                '${mealData?.totalAllCarbs}g',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
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
                                  color: const Color.fromRGBO(137, 132, 132, 1),
                                ),
                              ),
                              Text(
                                '${mealData?.totalAllProtein}g',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
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
                                '${mealData?.totalAllCalories}kcal',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
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
                          Text('  ${widget.formattedDate}  ',
                              style: AppWidget.dateboldTextFeildStyle()),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Bottomnav(initialPage: FoodList())));
                            },
                            child: Icon(
                              Icons.add_circle,
                              color: Color(0xFF4F6C4E),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        child:
                            PlanPage(meals: mealData?.meals ?? []), // Pass the meals here //CustomNavBar(onItemTapped: _onItemTapped),
                      ),
                      SizedBox(height: 10.0), 
                      // Display the selected page

                      //_pages[_selectedIndex],
                    ],
                  ),
                ),
              ),
            ),
          )
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
  final List<Meal> meals; // Store meals as a property

  const PlanPage({super.key, required this.meals}); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return SelfPlanWidget(meals: meals); // Pass meals to SelfPlanWidget
  }
}

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Exercisewidget();
  }
}
