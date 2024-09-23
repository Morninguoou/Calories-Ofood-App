import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_back.dart';

class FoodRecommendation extends StatefulWidget {
  const FoodRecommendation({super.key});

  @override
  State<FoodRecommendation> createState() => _FoodRecommendationState();
}

class _FoodRecommendationState extends State<FoodRecommendation> {
  String selectedGender = '';

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
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Gender:',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            )),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = 'Female';
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: selectedGender == 'Female'
                                  ? const Color.fromRGBO(240, 214, 181, 1)
                                  : Colors.white,
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
                              children: [
                                Icon(
                                  Icons.female, // ไอคอนที่แสดงข้างหน้า Female
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                    width: 5), // ระยะห่างระหว่างไอคอนและข้อความ
                                Text('Female',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20), // ระยะห่างระหว่างปุ่ม
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = 'Male';
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: selectedGender == 'Male'
                                  ? const Color.fromRGBO(240, 214, 181, 1)
                                  : Colors.white,
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
                              children: [
                                Icon(
                                  Icons.male, // ไอคอนที่แสดงข้างหน้า Male
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                    width: 5), // ระยะห่างระหว่างไอคอนและข้อความ
                                Text('Male',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Weight Management:',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        )),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: const IconBack(),
          ),
        ],
      ),
    );
  }
}