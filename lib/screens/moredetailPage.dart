import 'package:flutter/material.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/screens/mealplanPage.dart';
import 'package:projectapp/widget/widget_support.dart';

class MoreDetailPlanner extends StatefulWidget {
  const MoreDetailPlanner({super.key});

  @override
  State<MoreDetailPlanner> createState() => _MoreDetailPlannerState();
}

class _MoreDetailPlannerState extends State<MoreDetailPlanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D6B5), // Background color
      appBar: AppBar(
        title: Text('Plan A Elei'),
        backgroundColor: Color(0xFFF0D6B5),
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 36.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.access_time), Text('test_time')],
                  ),
                  Text('Date List: ',style: AppWidget.dateboldTextFeildStyle()),
                  SizedBox(height: 15.0),
                  Container( /////////////////////////////////////Box Widget
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Date : Monday, 18 August',
                                  style: AppWidget.dateboldTextFeildStyle()),
                              Icon(Icons.calendar_today_outlined)
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Fats\n31g',
                                  style: AppWidget.nutrientTextFeildStyle(),
                                ),
                              ),
                              Container(
                                child: Text('Carb.\n66g',
                                    style: AppWidget.nutrientTextFeildStyle()),
                              ),
                              Container(
                                child: Text('Proteins\n32g',
                                    style: AppWidget.nutrientTextFeildStyle()),
                              ),
                              Container(
                                child: Text('Calories\n1448cal',
                                    style: AppWidget.nutrientTextFeildStyle()),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Calories:1448 cal',
                                    style: AppWidget.totalcalTextFeildStyle()),
                                GestureDetector(
                                  child: Text('More Details',style: AppWidget.moredetailTextFeildStyle(),),
                                  onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Bottomnav(initialPage: MealPlan())));},
                                ),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),///////////////////////////////////////////////////////
                
                ],
              ),
            ),
             
            height: 656.0,
          ),
        ],
      ),
    );
  }
}
