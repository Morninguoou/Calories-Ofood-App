import 'package:flutter/material.dart';
import 'package:projectapp/screens/foodrecommendationPlan.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/optionblockgrey.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_back.dart';

class FoodRecommendationSelect extends StatefulWidget {
  const FoodRecommendationSelect({super.key});

  @override
  State<FoodRecommendationSelect> createState() =>
      _FoodRecommendationSelectState();
}

class _FoodRecommendationSelectState extends State<FoodRecommendationSelect> {
  String selectedGender = '';
  String selectedWeightManagement =
      'None'; // เพิ่มตัวแปรสำหรับ Weight Management
  String selectedTime = 'Morning';
  String selectedActivityLevel =
      'Sedentary'; // ตัวแปรสำหรับช่อง select ข้างๆ Time

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
                padding: const EdgeInsets.all(40),
                child: SingleChildScrollView(
                  // เพิ่มเพื่อรองรับ scroll ในกรณีเนื้อหาเยอะ
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Gender:',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              )),
                          const SizedBox(width: 25),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'Female';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
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
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.female, // ไอคอนที่แสดงข้างหน้า Female
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                      width:
                                          5), // ระยะห่างระหว่างไอคอนและข้อความ
                                  Text('Female',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 25), // ระยะห่างระหว่างปุ่ม
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'Male';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
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
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.male, // ไอคอนที่แสดงข้างหน้า Male
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                      width:
                                          5), // ระยะห่างระหว่างไอคอนและข้อความ
                                  Text('Male',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('Weight Management:',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          )),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // ปรับให้อยู่ตรงกลาง
                        children: [
                          // ปุ่มสำหรับ Gain
                          ChoiceChip(
                            label: Text(
                              'Gain',
                              style: TextStyle(
                                color: selectedWeightManagement == 'Gain'
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            selected: selectedWeightManagement == 'Gain',
                            selectedColor: Colors.grey[300],
                            backgroundColor: Colors.white,
                            onSelected: (selected) {
                              setState(() {
                                selectedWeightManagement = 'Gain';
                              });
                            },
                            shadowColor:
                                Colors.black.withOpacity(0.3), // สีเงาของปุ่ม
                            elevation: selectedWeightManagement == 'Gain'
                                ? 5
                                : 0, // เพิ่มเงาเมื่อถูกเลือก
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: selectedWeightManagement == 'Gain'
                                    ? Colors.black
                                    : Colors.black, // กำหนดสีกรอบเมื่อเลือก
                                width: 1, // ขนาดของเส้นกรอบ
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          // ปุ่มสำหรับ Loss
                          ChoiceChip(
                            label: Text(
                              'Loss',
                              style: TextStyle(
                                color: selectedWeightManagement == 'Loss'
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            selected: selectedWeightManagement == 'Loss',
                            selectedColor: Colors.grey[300],
                            backgroundColor: Colors.white,
                            onSelected: (selected) {
                              setState(() {
                                selectedWeightManagement = 'Loss';
                              });
                            },
                            shadowColor:
                                Colors.black.withOpacity(0.3), // สีเงาของปุ่ม
                            elevation: selectedWeightManagement == 'Loss'
                                ? 5
                                : 0, // เพิ่มเงาเมื่อถูกเลือก
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: selectedWeightManagement == 'Loss'
                                    ? Colors.black
                                    : Colors.black, // กำหนดสีกรอบเมื่อเลือก
                                width: 1, // ขนาดของเส้นกรอบ
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          // ปุ่มสำหรับ Stable
                          ChoiceChip(
                            label: Text(
                              'Stable',
                              style: TextStyle(
                                color: selectedWeightManagement == 'Stable'
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            selected: selectedWeightManagement == 'Stable',
                            selectedColor: Colors.grey[300],
                            backgroundColor: Colors.white,
                            onSelected: (selected) {
                              setState(() {
                                selectedWeightManagement = 'Stable';
                              });
                            },
                            shadowColor:
                                Colors.black.withOpacity(0.3), // สีเงาของปุ่ม
                            elevation: selectedWeightManagement == 'Stable'
                                ? 5
                                : 0, // เพิ่มเงาเมื่อถูกเลือก
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: selectedWeightManagement == 'Stable'
                                    ? Colors.black
                                    : Colors.black, // กำหนดสีกรอบเมื่อเลือก
                                width: 1, // ขนาดของเส้นกรอบ
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      // เพิ่ม Row สำหรับข้อความ Weight และ TextField
                      Row(
                        children: [
                          const Text(
                            'Weight :',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 240, 222, 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              // ปรับขนาดกรอบที่ใส่เลขที่นี่
                              constraints: const BoxConstraints(
                                  maxHeight: 40), // ตั้งค่าขนาดสูงสุด
                              child: TextField(
                                onChanged: (value) {
                                  // เพิ่มโค้ดเมื่อค่าถูกเปลี่ยน
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 15), // ปรับขนาดของช่อง
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none, // เพิ่มเส้นขอบ
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'to',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 240, 222, 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              constraints: const BoxConstraints(
                                  maxHeight: 40), // ตั้งค่าขนาดสูงสุด
                              child: TextField(
                                onChanged: (value) {
                                  // เพิ่มโค้ดเมื่อค่าถูกเปลี่ยน
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 15), // ปรับขนาดของช่อง
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none, // เพิ่มเส้นขอบ
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'kg.',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Row(
                        children: [
                          const Text(
                            'Activity Level :',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(
                                    255, 240, 222, 1), // สีพื้นหลัง
                                borderRadius:
                                    BorderRadius.circular(20), // มุมโค้ง
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.black.withOpacity(0.2), // สีเงา
                                    spreadRadius: 2, // ขยายขอบเขตของเงา
                                    blurRadius: 5, // ความเบลอของเงา
                                    offset: const Offset(0, 2), // ทิศทางเงา
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10), // ปรับ padding ที่นี่
                                child: DropdownButton<String>(
                                  value:
                                      selectedActivityLevel, // ค่าเริ่มต้นสำหรับระดับกิจกรรม
                                  items: <String>[
                                    'Sedentary', // ตัวเลือกสำหรับระดับกิจกรรม
                                    'Lightly Active',
                                    'Moderately Active',
                                    'Very Active',
                                    'Super Active',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedActivityLevel =
                                          newValue!; // อัปเดตค่าของ selectedActivityLevel
                                    });
                                  },
                                  isExpanded: true,
                                  underline:
                                      const SizedBox(), // ปิดเส้นขอบที่อยู่ด้านล่าง
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const Text('Additional Options :',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          )),
                      const SizedBox(height: 15),
                      const Optionblockgrey(),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const Text('Time :',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              )),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(
                                    255, 240, 222, 1), // สีพื้นหลัง
                                borderRadius:
                                    BorderRadius.circular(20), // มุมโค้ง
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.black.withOpacity(0.2), // สีเงา
                                    spreadRadius: 2, // ขยายขอบเขตของเงา
                                    blurRadius: 5, // ความเบลอของเงา
                                    offset: const Offset(0, 2), // ทิศทางเงา
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10), // ปรับ padding ที่นี่
                                child: DropdownButton<String>(
                                  value: selectedTime,
                                  items: <String>[
                                    'Morning',
                                    'Afternoon',
                                    'Evening'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: selectedWeightManagement ==
                                          'Stable'
                                      ? (String? newValue) {
                                          setState(() {
                                            selectedTime = newValue!;
                                          });
                                        }
                                      : null, // ปิดการใช้งานเมื่อเลือก Gain หรือ Loss
                                  isExpanded: true,
                                  underline:
                                      const SizedBox(), // ปิดเส้นขอบที่อยู่ด้านล่าง
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          // ตรวจสอบข้อมูลกับ backend
                          bool dataIsValid = checkDataWithBackend();

                          if (dataIsValid) {
                            // ถ้าข้อมูลถูกต้อง ให้ไปยังหน้า FoodRecommendationsPage
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Bottomnav(
                                        initialPage:
                                            FoodRecommendationPlan())));
                          } else {
                            // ถ้าข้อมูลไม่ถูกต้อง แสดง popup
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("No Food Recommendations"),
                                  content: const Text(
                                      "Based on your selections, we are unable to recommend any food. Please choose new options."),
                                  actions: [
                                    TextButton(
                                      child: const Text("Go Back"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // ปิด popup
                                      },
                                    ),
                                  ],
                                );
                              },
                              barrierColor: Colors.grey
                                  .withOpacity(0.5), // พื้นหลังโปร่งใสสีเทา
                            );
                          }
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
                                Icons.thumb_up_alt_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Recommend Food",
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
                      )
                    ],
                  ),
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

  bool checkDataWithBackend() {
    // ตรงนี้คุณจะต้องเขียนการเช็คข้อมูลจาก backend จริง
    // return true ถ้าข้อมูลถูกต้อง
    // return false ถ้าข้อมูลไม่ถูกต้อง
    return true; // ปัจจุบันจะคืนค่า false เสมอ
  }
}
