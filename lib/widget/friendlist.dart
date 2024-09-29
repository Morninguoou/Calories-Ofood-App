import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';


class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final List<Map<String, String>> friends = [
    {'name': 'Manee', 'profileImage': 'assets/images/bonchon_wing.jpg'},
    {'name': 'Robert', 'profileImage': 'assets/images/bonchon_wing.jpg'},
    {'name': 'Robert', 'profileImage': 'assets/images/bonchon_wing.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return Container(
            margin:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFFFCF5EC), // พื้นหลังเหมือนกับรูป
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // สีของเส้นขอบ
                  width: 1, // ความหนาของเส้นขอบ
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // กำหนดขนาดรูปภาพแบบตายตัว
                SizedBox(
                  width: 60, // กำหนดขนาดความกว้างคงที่
                  height: 60, // กำหนดขนาดความสูงคงที่
                  child: ClipOval(
                    child: Image.asset(
                      friend['profileImage']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20), // ระยะห่างระหว่างรูปและชื่อ
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          friend['name']!,
                          style: AppWidget.dateboldTextFeildStyle(),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // ฟังก์ชันสำหรับดูโปรไฟล์
                          },
                          child: Text(
                            'View profile',
                            style: TextStyle(
                              color: Color(0xFF4F6C4E),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Expanded(
                            // ปุ่ม Accept
                            child: GestureDetector(
                              onTap: () {
                                // TODOTap to random food
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 79, 108, 78),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Accept",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10), // ระยะห่างระหว่างปุ่ม
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // TODOTap to random food
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 79, 108, 78),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ปุ่ม View Profile อยู่มุมขวา
              ],
            ),
          );
        },
      ),
    );
  }
}
