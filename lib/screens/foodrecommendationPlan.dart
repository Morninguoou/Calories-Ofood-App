import 'package:flutter/material.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/screens/mealplanPage.dart';
import 'package:projectapp/screens/moredetailPage.dart';
import 'package:projectapp/screens/plannermainPage.dart';
import 'package:projectapp/widget/bonchonEdit_box.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/optionblockgrey.dart';
import 'package:projectapp/widget/planlistforrecommen.dart';
import 'package:projectapp/widget/widget_support.dart';

class FoodRecommendationPlan extends StatefulWidget {
  const FoodRecommendationPlan({super.key});

  @override
  State<FoodRecommendationPlan> createState() => _FoodRecommendationPlanState();
}

class _FoodRecommendationPlanState extends State<FoodRecommendationPlan> {
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
            child: SingleChildScrollView(
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.access_time), Text('test_time')],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Planlist(),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // แสดง popup สร้าง Planner
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            String plannerName =
                                ""; // ตัวแปรเก็บชื่อ Planner ที่กรอก

                            return AlertDialog(
                              title: Text("Create Planner"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Planner Name"),
                                  TextField(
                                    onChanged: (value) {
                                      plannerName =
                                          value; // อัพเดทค่าที่ผู้ใช้กรอก
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter planner name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // ปิด popup
                                  },
                                ),
                                ElevatedButton(
                                  child: Text("Create!"),
                                  onPressed: () {
                                    if (plannerName.isNotEmpty) {
                                      // ตรวจสอบว่าผู้ใช้ได้กรอกชื่อ Planner หรือไม่
                                      Navigator.of(context).pop(); // ปิด popup

                                      // ทำการนำทางไปยังหน้าถัดไป (เช่นหน้า PlannerPage)
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Bottomnav(
                                                  initialPage: PlannerMain())));
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                          barrierColor: Colors.grey
                              .withOpacity(0.5), // พื้นหลังโปร่งใสสีเทา
                        );
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
                            ),
                          ],
                        ),
                      ),
                    ),
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
