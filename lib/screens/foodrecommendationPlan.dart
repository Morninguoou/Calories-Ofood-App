import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectapp/api/authentication.dart';
import 'package:projectapp/api/foodrecommendationplanPage.dart';
import 'package:projectapp/api/planindatelistPage.dart';
import 'package:projectapp/models/recommendplan.dart';
import 'package:projectapp/providers/session_provider.dart';
import 'package:projectapp/screens/foodrecommendationPlanDetail.dart';
import 'package:projectapp/screens/plannermainPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/icon_back.dart';

import 'package:projectapp/widget/widget_support.dart';
import 'package:provider/provider.dart';

List<PlanAppRecommend> planners = [];
bool isLoading = true;

class FoodRecommendationPlan extends StatefulWidget {
  const FoodRecommendationPlan({super.key, required data});

  @override
  State<FoodRecommendationPlan> createState() => _FoodRecommendationPlanState();
}

class _FoodRecommendationPlanState extends State<FoodRecommendationPlan> {
  String plannerName = '';
  String userId = '';
  String errorText = '';

  Future<bool> checkDataWithBackend() async {
    try {
      final sessionProvider =
          Provider.of<SessionProvider>(context, listen: false);
      String idToken = sessionProvider.idToken;

      // Get current user ID
      Map<String, dynamic> currentUser =
          await AuthService.getCurrentUser(idToken);
      userId = currentUser['uid'];
      var url = Uri.parse('http://10.0.2.2/AddtoPlanner/$userId');
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"PlannerName": plannerName}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("Response data: $data"); // แสดงข้อมูลที่ได้รับจาก API

        // ตรวจสอบว่ามี key 'isValid' หรือไม่
        if (data.containsKey('status')) {
          if (data['status'] == 'OK') {
            print("test");
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        throw Exception(
            'Failed to check data with status: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in checkDataWithBackend: $e");
      return false;
    }
  }

  late List<PlanAppRecommend> plannerData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<PlanAppRecommend> fetchedPlanners =
          await PlanAppRecommendService.getFoodRecommendationView();
      print("comming");
      setState(() {
        planners = fetchedPlanners;
        print(planners); // Update planners with fetched data
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
                    Expanded(
                      child: SingleChildScrollView(
                        child:
                            planlist(), // ใช้ PlanList() ที่สร้างขึ้นด้านล่าง
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // แสดง popup สร้าง Planner
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Create Planner"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Planner Name"),
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        plannerName = value;
                                        errorText =
                                            ''; // Reset error message when input changes
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter planner name",
                                      border: const OutlineInputBorder(),
                                      errorText: errorText.isNotEmpty
                                          ? errorText
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog
                                  },
                                ),
                                ElevatedButton(
                                    child: const Text("Create!"),
                                    onPressed: () async {
                                      if (plannerName.isNotEmpty) {
                                        bool dataIsValid =
                                            await checkDataWithBackend();
                                        print(dataIsValid);
                                        if (dataIsValid) {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Bottomnav(
                                                          initialPage:
                                                              PlannerMain(
                                                                  userID:
                                                                      userId))));
                                          print(plannerName);
                                        } else {
                                          setState(() {
                                            errorText =
                                                'Please enter a new name';
                                          });
                                        }
                                      }
                                      ;
                                    }),
                              ],
                            );
                          },
                          barrierColor: Colors.grey.withOpacity(0.5),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 79, 108, 78),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
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

class planlist extends StatelessWidget {
  const planlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // เพื่อให้ไม่ใช้พื้นที่เกินความจำเป็น
      physics:
          const NeverScrollableScrollPhysics(), // ปิดการเลื่อนใน ListView นี้
      itemCount: planners.length, // จำนวนรายการที่ต้องการ
      itemBuilder: (context, index) {
        String formattedDate =
            DateFormat('dd MMMM').format(planners[index].createdAt);
        return Container(
            margin: const EdgeInsets.symmetric(
                vertical: 5), // ตั้งค่าระยะห่างระหว่างรายการ
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Date : ${formattedDate}',
                        style: AppWidget.dateboldTextFeildStyle(),
                      ),
                      SizedBox(width: 8.0),
                      Icon(Icons.calendar_today_outlined, size: 18),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Breakfast : ${planners[index].breakfast}'),
                      SizedBox(height: 8.0),
                      Text('Lunch : ${planners[index].lunch}'),
                      SizedBox(height: 8.0),
                      Text('Dinner : ${planners[index].dinner}'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey[300]),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Calories : ${planners[index].calories} cal',
                          style: AppWidget.totalcalTextFeildStyle()),
                      GestureDetector(
                        child: Text('More Details',
                            style: AppWidget.moredetailTextFeildStyle()),
                        onTap: () {
                          print('${planners[index].plannerID}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bottomnav(
                                        initialPage:
                                            FoodRecommendationPlanDetail(
                                          plannerID: planners[index].plannerID,
                                        ),
                                      )));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ) // แสดง Planlist() ที่คุณมีอยู่แล้ว
            );
      },
    );
  }
}
