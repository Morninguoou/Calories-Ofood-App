import 'package:flutter/material.dart';
import 'package:projectapp/screens/mealplanPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Fats',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(137, 132, 132, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '31g',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
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
                                  color: Color.fromRGBO(137, 132, 132, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '31g',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
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
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '31g',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
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
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '500kcal',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
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
                                        const Text(
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
                            const SizedBox(height: 10),
                            Container(
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
                                        const Text(
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
                            const SizedBox(height: 10),
                            Container(
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
                                        const Text(
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
                            const SizedBox(height: 10),
                            Container(
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
                                          'other',
                                          style: AppWidget
                                              .headlineTextFeildStyle(),
                                        ),
                                        const Text(
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
                          ],
                        ),
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
                            String plannerName =
                                ""; // ตัวแปรเก็บชื่อ Planner ที่กรอก

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
                                  onPressed: () {
                                    if (plannerName.isNotEmpty) {
                                      // ตรวจสอบว่าผู้ใช้ได้กรอกชื่อ Planner หรือไม่
                                      Navigator.of(context).pop(); // ปิด popup

                                      // ทำการนำทางไปยังหน้าถัดไป (เช่นหน้า PlannerPage)
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const Bottomnav(initialPage: MealPlan())));
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
