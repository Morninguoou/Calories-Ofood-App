import 'package:flutter/material.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/screens/mealplanPage.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_share.dart';

class MoreDetailPlanner extends StatefulWidget {
  const MoreDetailPlanner({super.key});

  @override
  State<MoreDetailPlanner> createState() => _MoreDetailPlannerState();
}

class _MoreDetailPlannerState extends State<MoreDetailPlanner> {
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
                  Text(' Plan 1'),

                  /// plan name
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
      body: SingleChildScrollView(
        // Wrap the body in a SingleChildScrollView
        child: Column(
          children: [
            SizedBox(height: 4,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time),
                        Text(' 1 week・18 August - 24 August')
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Date List: ',
                        style: AppWidget.dateboldTextFeildStyle()),
                    SizedBox(height: 20.0),
                    Container(
                      // Box Widget
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
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Date : Monday, 18 August',
                                      style:
                                          AppWidget.dateboldTextFeildStyle()),
                                  Icon(Icons.calendar_today_outlined)
                                ],
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('Fats',style: AppWidget.nutrientTextFeildStyle().copyWith(color: const Color.fromRGBO(137, 132, 132, 1),),),
                                    Text('31g',style: AppWidget.nutrientTextFeildStyle(),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Carb.',style: AppWidget.nutrientTextFeildStyle().copyWith(color: const Color.fromRGBO(137, 132, 132, 1),),),
                                    Text('66g',style: AppWidget.nutrientTextFeildStyle(),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Proteins',style: AppWidget.nutrientTextFeildStyle().copyWith(color: const Color.fromRGBO(137, 132, 132, 1),),),
                                    Text('32g',style: AppWidget.nutrientTextFeildStyle(),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Calories',style: AppWidget.nutrientTextFeildStyle().copyWith(color: const Color.fromRGBO(137, 132, 132, 1),),),
                                    Text('1448cal',style: AppWidget.nutrientTextFeildStyle(),)
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
                                  Text('Total Calories: 1448 cal',
                                      style:
                                          AppWidget.totalcalTextFeildStyle()),
                                  GestureDetector(
                                    child: Text(
                                      'More Details',
                                      style:
                                          AppWidget.moredetailTextFeildStyle(),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Bottomnav(
                                                  initialPage: MealPlan())));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height,
            ),
          ],
        ),
      ),
    );
  }
}
