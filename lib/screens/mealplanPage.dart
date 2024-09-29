import 'package:flutter/material.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/bonchonEdit_box.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_share.dart';


class MealPlan extends StatefulWidget {
  const MealPlan({super.key});

  @override
  State<MealPlan> createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D6B5), // Background color
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Plan A Elei'),
              IconShare(),
            ],
            ),
        ),
        backgroundColor: Color(0xFFF0D6B5),
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 36.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 656,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    color:
                                        const Color.fromRGBO(137, 132, 132, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '31g',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  'Carb.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        const Color.fromRGBO(137, 132, 132, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '31g',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
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
                                    color:
                                        const Color.fromRGBO(137, 132, 132, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '31g',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
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
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '500kcal',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today_outlined),
                              Text('  Monday, 18 August  ',
                                  style: AppWidget.dateboldTextFeildStyle()),
                              GestureDetector(
                                child: Icon(
                                  Icons.add_circle,
                                  color: Color(0xFF4F6C4E),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Bottomnav(
                                              initialPage: FoodList())));
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        // ทำให้เลื่อนลงได้ด้วย SingleChildScrollView
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10.0,
                                    left: 12.0,
                                    right: 12.0,
                                    bottom: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Breakfast',
                                            style: AppWidget
                                                .dateboldTextFeildStyle()),
                                        Text('Total Calories:850 cal',
                                            style: AppWidget
                                                .totalcalTextFeildStyle()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    BonchonBox(),
                                    BonchonBox(),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10.0,
                                    left: 12.0,
                                    right: 12.0,
                                    bottom: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Lunch',
                                            style: AppWidget
                                                .dateboldTextFeildStyle()),
                                        Text('Total Calories:850 cal',
                                            style: AppWidget
                                                .totalcalTextFeildStyle()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    BonchonBox(),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10.0,
                                    left: 12.0,
                                    right: 12.0,
                                    bottom: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Dinner',
                                            style: AppWidget
                                                .dateboldTextFeildStyle()),
                                        Text('Total Calories:850 cal',
                                            style: AppWidget
                                                .totalcalTextFeildStyle()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    BonchonBox(),
                                    BonchonBox(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
