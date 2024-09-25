import 'package:flutter/material.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/widget_support.dart';

class Dailycalories extends StatefulWidget {
  const Dailycalories({super.key});

  @override
  State<Dailycalories> createState() => _DailycaloriesState();
}

class _DailycaloriesState extends State<Dailycalories> {
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
                    'Daily Calories',
                    style: AppWidget.headlineTextFeildStyle(),
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
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55),
                  topRight: Radius.circular(55),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(25),
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
                                color: const Color.fromRGBO(137, 132, 132, 1),
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
                                color: const Color.fromRGBO(137, 132, 132, 1),
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
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Color.fromRGBO(187, 207, 63, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Breakfast',
                                  style: AppWidget.headlineTextFeildStyle(),
                                ),
                                Text(
                                  'Oatmeal with fruits and nuts',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Align เพื่อจัดวาง 450cal ไปทางขวาบน
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '450cal',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Color.fromRGBO(232, 235, 80, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lunch',
                                  style: AppWidget.headlineTextFeildStyle(),
                                ),
                                Text(
                                  'Oatmeal with fruits and nuts',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Align เพื่อจัดวาง 450cal ไปทางขวาบน
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '450cal',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Color.fromRGBO(243, 164, 12, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dinner',
                                  style: AppWidget.headlineTextFeildStyle(),
                                ),
                                Text(
                                  'Oatmeal with fruits and nuts',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Align เพื่อจัดวาง 450cal ไปทางขวาบน
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '450cal',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Color.fromRGBO(206, 134, 239, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'other',
                                  style: AppWidget.headlineTextFeildStyle(),
                                ),
                                Text(
                                  'Oatmeal with fruits and nuts',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Align เพื่อจัดวาง 450cal ไปทางขวาบน
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '450cal',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // TODOTap to random food
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 79, 108, 78),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Add to Planner",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: const IconBack(),
          ),
        ],
      ),
    );
  }
}
