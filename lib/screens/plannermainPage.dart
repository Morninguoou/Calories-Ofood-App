import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectapp/api/plannermainPage.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/screens/planindatelistPage.dart';
import 'package:projectapp/widget/widget_support.dart';

import 'package:projectapp/models/plannermainPage.dart';

class PlannerMain extends StatefulWidget {
  const PlannerMain({super.key});

  @override
  State<PlannerMain> createState() => _PlannerMainState();
}

class _PlannerMainState extends State<PlannerMain> {
  List<PlannermainPageModel> planners = []; // Store fetched planners
  String userID = 'test0'; // Replace with the actual user ID
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchPlanners();
  }

  Future<void> fetchPlanners() async {
    try {
      List<PlannermainPageModel> fetchedPlanners =
          await PlannerService.getPlannersByUserID(userID);
      setState(() {
        planners = fetchedPlanners; // Update planners with fetched data
        isLoading = false; // Set loading to false after data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Set loading to false on error
      });
      // Optionally show an error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error fetching planners: $e')));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D6B5), // Background color
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Meal Plan'),
        backgroundColor: Color(0xFFF0D6B5),
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 36.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 253, 253),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                    ),
                  ),
                  height: 656.0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: ListView.builder(
                      itemCount: planners.length, // Number of items to display
                      itemBuilder: (context, index) {
                        PlannermainPageModel planner = planners[index];
                        return Container(
                          margin: EdgeInsets.only(
                              top: 10.0, left: 5, right: 5, bottom: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            //border: Border.all(color: Colors.black), // Added border
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  // Align the text to the top-left
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      planner.planName,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            10), // Adds spacing between texts
                                    Text(
                                      'Details of Plan ${index + 1}.\n\n',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    // Ensure text can wrap properly
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time),
                                        Text(
                                            ' ${planner.formattedFirstDate}  To  ${planner.formattedLastDate}'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Positioned icon in the top-right corner
                              Positioned(
                                top: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext) {
                                        return AlertDialog(
                                          titlePadding: EdgeInsets.zero,
                                          backgroundColor: Color(0xFFF0D6B5),
                                          title: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25)),
                                                color: Colors.red),
                                            child: Icon(
                                              Icons.warning_rounded,
                                              size: 40,
                                            ),
                                          ),
                                          content: Text(
                                            'Are you sure you want to delete ?',
                                            style: AppWidget
                                                    .nutrientTextFeildStyle()
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 90,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF4F6C4E),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.3),
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Text(
                                                      'Cancel',
                                                      style: AppWidget
                                                              .lightTextFeildStyle()
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 90,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.3),
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Text(
                                                      'Confirm',
                                                      style: AppWidget
                                                              .lightTextFeildStyle()
                                                          .copyWith(
                                                              color:
                                                                  Colors.red),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 50,
                                child: GestureDetector(
                                  child: Text(
                                    'More Detail',
                                    style: AppWidget.moredetailTextFeildStyle(),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Bottomnav(
                                                initialPage:
                                                    MoreDetailPlanner())));
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bottomnav(initialPage: FoodList())));
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                height: 40,
                constraints: const BoxConstraints(
                  maxWidth: 200,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF4F6C4E),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.add_circle_outline_sharp,
                      color: Color(0xFFFFFFFF),
                    ),
                    Text(
                      'Add More Planner',
                      style: AppWidget.lightTextFeildStyle()
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}