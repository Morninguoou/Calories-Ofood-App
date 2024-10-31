import 'package:flutter/material.dart';
import 'package:projectapp/screens/foodrecommendationPlanDetail.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/widget_support.dart';

class Planlist extends StatefulWidget {
  const Planlist({super.key});

  @override
  State<Planlist> createState() => _PlanlistState();
}

class _PlanlistState extends State<Planlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        /////////////////////////////////////Box Widget
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
            margin: EdgeInsets.only(
                top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Date : Monday, 18 August',
                      style: AppWidget.dateboldTextFeildStyle()),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(Icons.calendar_today_outlined)
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Calories:1448 cal',
                        style: AppWidget.totalcalTextFeildStyle()),
                    GestureDetector(
                      child: Text(
                        'More Details',
                        style: AppWidget.moredetailTextFeildStyle(),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bottomnav(
                                    initialPage:
                                        FoodRecommendationPlanDetail())));
                      },
                    ),
                  ],
                ),
              ),
            ])));
  }
}
