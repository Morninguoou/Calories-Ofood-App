import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projectapp/api/authentication.dart';
import 'package:projectapp/models/dailyinfobar.dart';
import 'package:projectapp/providers/session_provider.dart';
import 'package:projectapp/screens/dailycaloriesedit.dart';
import 'package:projectapp/screens/plannermainPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:provider/provider.dart';

class Dailycalories extends StatefulWidget {
  final bool checkPopup;

  const Dailycalories({Key? key, required this.checkPopup}) : super(key: key);

  @override
  State<Dailycalories> createState() => _DailycaloriesState();
}

class _DailycaloriesState extends State<Dailycalories> {
  Future<FoodCalculated> fetchFoodCalculated() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2/Calculationplanner'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return FoodCalculated.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> fetchFoodForMeal(String mealType) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2/Addtomeal/$mealType'));
    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void onTapMeal(String mealType) async {
    print(mealType);
    try {
      final FoodData = await fetchFoodForMeal(mealType);
      print(FoodData);

      // ตรวจสอบว่า foodData ไม่ใช่ null ก่อนทำการนำไปใช้
      if (FoodData != false) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Dailycaloriesedit(foodData: foodData),
        //   ),
        // );
      } else {
        print("Error: foodData is null");
        // แจ้งเตือนผู้ใช้หรือจัดการในกรณีที่ foodData เป็น null
      }
    } catch (e) {
      // Handle any error if needed
      print("Error: $e");
    }
  }
//   void onTapMeal(String mealType) async {
//   try {
//     final foodData = await fetchFoodForMeal(mealType);

//     // ตรวจสอบค่าของ getcurrentfood
//     if (foodData.getcurrentfood == null) {
//       // แสดง Alert ถ้า getcurrentfood เป็น null
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text("Can't add"),
//             actions: <Widget>[
//               TextButton(
//                 child: Text("OK"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     } else if (foodData.getcurrentfood == true) {
//       // แสดง Alert ถ้า getcurrentfood เป็น true
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Success"),
//             content: Text("Add OK"),
//             actions: <Widget>[
//               TextButton(
//                 child: Text("OK"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }

//     // หาก foodData.getcurrentfood ไม่เป็น null หรือ true ก็ให้ไปยังหน้า Dailycaloriesedit
//     if (foodData.getcurrentfood != null && foodData.getcurrentfood == false) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Dailycaloriesedit(foodData: foodData),
//         ),
//       );
//     }
//   } catch (e) {
//     // Handle any error if needed
//     print("Error: $e");
//   }
// }

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

      print(userId);
      var url = Uri.parse('http://10.0.2.2/AddDailyMealToDB/${userId}/${plannerName}');
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        // body: jsonEncode({"PlannerName": plannerName}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("Response data: $data"); // แสดงข้อมูลที่ได้รับจาก API

        // ตรวจสอบว่ามี key 'isValid' หรือไม่
        // if (data == "Add to existing planner success") {
        print("test");
        return true;
        // } else {
        //   return false;
        // }
      } else {
        throw Exception(
            'Failed to check data with status: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in checkDataWithBackend: $e");
      return false;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60, left: 20),
                  child: Text(
                    'Daily Calories',
                    style: AppWidget.headlineTextFeildStyle()
                        .copyWith(letterSpacing: 0.5, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 7.7,
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
                    FutureBuilder<FoodCalculated>(
                      future: fetchFoodCalculated(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final foodData = snapshot.data!;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Fats',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(137, 132, 132, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${foodData.fats}g',
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
                                      color: Color.fromRGBO(137, 132, 132, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${foodData.carbs}g',
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
                                      color: Color.fromRGBO(137, 132, 132, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${foodData.protein}g',
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
                                    '${foodData.calories} kcal',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Text("No data available");
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              onTapMeal('Breakfast');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: const Color.fromRGBO(187, 207, 63, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Breakfast',
                                          style: AppWidget
                                              .headlineTextFeildStyle(),
                                        ),
                                        SizedBox(height: 20,)
                                        // const Text(
                                        //   'Oatmeal with fruits and nuts',
                                        //   style: TextStyle(
                                        //     fontSize: 13,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  const Align(
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
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              onTapMeal('Lunch');
                              print('Lunch');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: const Color.fromRGBO(232, 235, 80, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lunch',
                                          style: AppWidget
                                              .headlineTextFeildStyle(),
                                        ),
                                        SizedBox(height: 20,)
                                        // const Text(
                                        //   'Oatmeal with fruits and nuts',
                                        //   style: TextStyle(
                                        //     fontSize: 13,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  const Align(
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
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              onTapMeal('Dinner');
                              print('Dinner');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: const Color.fromRGBO(243, 164, 12, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dinner',
                                          style: AppWidget
                                              .headlineTextFeildStyle(),
                                        ),
                                        SizedBox(height: 20,)
                                        // const Text(
                                        //   'Oatmeal with fruits and nuts',
                                        //   style: TextStyle(
                                        //     fontSize: 13,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  const Align(
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
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              onTapMeal('Other');
                              print('Other');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: const Color.fromRGBO(206, 134, 239, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Other',
                                          style: AppWidget
                                              .headlineTextFeildStyle(),
                                        ),
                                        SizedBox(height: 20,)
                                        // const Text(
                                        //   'Oatmeal with fruits and nuts',
                                        //   style: TextStyle(
                                        //     fontSize: 13,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  const Align(
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
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // แสดง popup สร้าง Planner
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            plannerName =
                                ''; // ตัวแปรเก็บชื่อ Planner ที่กรอก

                            return AlertDialog(
                              title: const Text("Create Planner"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Planner Name"),
                                  TextField(
                                    onChanged: (value) {
                                      plannerName =
                                          value; // อัพเดทค่าที่ผู้ใช้กรอก
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Enter planner name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // ปิด popup
                                  },
                                ),
                                ElevatedButton(
                                  child: const Text("Create!"),
                                  onPressed: () async {
                                    if (plannerName.isNotEmpty) {
                                      bool dataIsValid =
                                          await checkDataWithBackend();
                                      print(plannerName);
                                      print(dataIsValid);
                                      if (dataIsValid) {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Bottomnav(
                                                    initialPage: PlannerMain(
                                                        userID: userId))));
                                      }
                                      ;
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
        ],
      ),
    );
  }
}
