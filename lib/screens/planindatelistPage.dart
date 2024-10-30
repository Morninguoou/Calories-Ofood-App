import 'package:flutter/material.dart';
import 'package:projectapp/api/planindatelistPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/screens/mealplanPage.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_share.dart';

import '../models/planindatelistPage.dart';
import 'package:intl/intl.dart';

class MoreDetailPlanner extends StatefulWidget {
  final String planName;
  const MoreDetailPlanner({super.key, required this.planName});

  @override
  State<MoreDetailPlanner> createState() => _MoreDetailPlannerState();
}

class _MoreDetailPlannerState extends State<MoreDetailPlanner> {
  bool isLoading = true;
  late PlanDateListModel
      plannerData; // Declare `plannerData` specific to this state

  @override
  void initState() {
    super.initState();
    fetchPlanners(widget.planName);
  }

  Future<void> fetchPlanners(String planName) async {
    try {
      plannerData = await PlanDateListService.getPlannersByPlanName(planName);
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
      backgroundColor: Color(0xFFF0D6B5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 9, left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconBack(),
                  Text(' ${widget.planName}'), // Plan name
                ],
              ),
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
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time),
                            Text(
                                '  ${plannerData.firstDate.day} ${DateFormat('MMMM').format(plannerData.firstDate)} ${plannerData.firstDate.year} - ${plannerData.lastDate.day} ${DateFormat('MMMM').format(plannerData.lastDate)} ${plannerData.firstDate.year}'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('Date List:',
                            style: AppWidget.dateboldTextFeildStyle()),
                        SizedBox(height: 20.0),
                        for (var planner in plannerData.planners)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          'Date : ${DateFormat('EEEE').format(planner.plannerDate)}, ${planner.plannerDate.day} ${DateFormat('MMMM').format(planner.plannerDate)}',
                                          style: AppWidget
                                              .dateboldTextFeildStyle()),
                                      Icon(Icons.calendar_today_outlined),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Fats',
                                            style: AppWidget
                                                    .nutrientTextFeildStyle()
                                                .copyWith(
                                              color: const Color.fromRGBO(
                                                  137, 132, 132, 1),
                                            )),
                                        Text('${planner.totalFat}g',
                                            style: AppWidget
                                                .nutrientTextFeildStyle()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Carb.',
                                            style: AppWidget
                                                    .nutrientTextFeildStyle()
                                                .copyWith(
                                              color: const Color.fromRGBO(
                                                  137, 132, 132, 1),
                                            )),
                                        Text('${planner.totalCarb}g',
                                            style: AppWidget
                                                .nutrientTextFeildStyle()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Proteins',
                                            style: AppWidget
                                                    .nutrientTextFeildStyle()
                                                .copyWith(
                                              color: const Color.fromRGBO(
                                                  137, 132, 132, 1),
                                            )),
                                        Text('${planner.totalProtein}g',
                                            style: AppWidget
                                                .nutrientTextFeildStyle()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Calories',
                                            style: AppWidget
                                                    .nutrientTextFeildStyle()
                                                .copyWith(
                                              color: const Color.fromRGBO(
                                                  137, 132, 132, 1),
                                            )),
                                        Text('${planner.totalCalories}cal',
                                            style: AppWidget
                                                .nutrientTextFeildStyle()),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.0),
                                Container(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Total Calories: ${planner.totalCalories} cal',
                                          style: AppWidget
                                              .totalcalTextFeildStyle()),
                                      GestureDetector(
                                        child: Text('More Details',
                                            style: AppWidget
                                                .moredetailTextFeildStyle()),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Bottomnav(
                                                          initialPage: MealPlan(
                                                              plannerID: planner.plannerID,
                                                              planName: widget.planName,
                                                              formattedDate: '${DateFormat('EEEE').format(planner.plannerDate)}, ${planner.plannerDate.day} ${DateFormat('MMMM').format(planner.plannerDate)}',))));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
