import 'package:flutter/material.dart';
import 'package:projectapp/widget/exerciseWidget.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/planWidget.dart';
import 'package:projectapp/widget/widget_support.dart';

class FoodRecommendationPlanDetail extends StatefulWidget {
  const FoodRecommendationPlanDetail({super.key});

  @override
  State<FoodRecommendationPlanDetail> createState() =>
      _FoodRecommendationPlanDetailState();
}

class _FoodRecommendationPlanDetailState
    extends State<FoodRecommendationPlanDetail> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PlanPage(),
    const ExercisePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  margin: const EdgeInsets.only(top: 60),
                  child: Text(
                    'Food Recommendation',
                    style: AppWidget.boldTextFeildStyle(),
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Fats',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(137, 132, 132, 1),
                                ),
                              ),
                              Text(
                                '31g',
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
                                  color: Color.fromRGBO(137, 132, 132, 1),
                                ),
                              ),
                              Text(
                                '31g',
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
                                  color: Color.fromRGBO(137, 132, 132, 1),
                                ),
                              ),
                              Text(
                                '31g',
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
                                '500kcal',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_today_outlined),
                          Text('  Monday, 18 August  ',
                              style: AppWidget.dateboldTextFeildStyle()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        child: CustomNavBar(onItemTapped: _onItemTapped),
                      ),
                      const SizedBox(height: 10.0),
                      // Display the selected page

                      _pages[_selectedIndex],
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: 30,
            child: IconBack(),
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
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Planwidget();
  }
}

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Exercisewidget();
  }
}
