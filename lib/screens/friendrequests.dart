import 'package:flutter/material.dart';
import 'package:projectapp/screens/friendprofile.dart';
import 'package:projectapp/widget/friendlist.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/widget_support.dart';

class Friendrequests extends StatefulWidget {
  const Friendrequests({super.key});

  @override
  State<Friendrequests> createState() => _FriendrequestsState();
}

class _FriendrequestsState extends State<Friendrequests> {
  // ตัวอย่างข้อมูลเพื่อน
  final List<Map<String, String>> friends = [
    {'name': 'Manee', 'profileImage': 'assets/images/bonchon_wing.jpg'},
    {'name': 'Robert', 'profileImage': 'assets/images/bonchon_wing.jpg'},
    {'name': 'Alice', 'profileImage': 'assets/images/bonchon_wing.jpg'},
  ];

  String searchName = ''; // ตัวแปรเก็บชื่อที่ค้นหา
  Map<String, String>? foundFriend; // ตัวแปรเก็บข้อมูลเพื่อนที่พบ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF5EC),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 120.0,
                child: Stack(
                  children: [
                    Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 214, 181, 1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, left: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Friend Requests',
                              style: AppWidget.headlineTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 60,
                left: 30,
                child: const IconBack(),
              ),
              Positioned(
                top: 60,
                right: 30,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Add friend"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 25, right: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    searchName = value; // เก็บชื่อที่ค้นหา
                                    setState(() {
                                      foundFriend = friends.firstWhere(
                                        (friend) =>
                                            friend['name']?.toLowerCase() ==
                                            searchName.toLowerCase(),
                                        orElse: () => {},
                                      );
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Search Name',
                                    hintStyle:
                                        AppWidget.verylightTextFeildStyle(),
                                    border: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          foundFriend = friends.firstWhere(
                                            (friend) =>
                                                friend['name']?.toLowerCase() ==
                                                searchName.toLowerCase(),
                                            orElse: () => {},
                                          );
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 79, 108, 78),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              if (foundFriend != null) // แสดงผลเพื่อนที่ค้นพบ
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          foundFriend!['profileImage']!),
                                    ),
                                    SizedBox(width: 10),
                                    Text(foundFriend!['name']!),
                                  ],
                                )
                              else if (searchName
                                  .isNotEmpty) // ถ้าไม่พบผู้ใช้งาน
                                Text('ไม่พบผู้ใช้งาน',
                                    style: TextStyle(color: Colors.red)),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: Text("Add friend"),
                              onPressed: () {
                                Navigator.of(context).pop(); // ปิด popup
                              },
                            ),
                            ElevatedButton(
                              child: Text("View profile"),
                              onPressed: () {
                                if (foundFriend != null) {
                                  // หากพบเพื่อน
                                  Navigator.of(context).pop();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Friendprofile()), // เปลี่ยนหน้า
                                  ); // TODOTap to random food// ปิด popup
                                }
                              },
                            ),
                          ],
                        );
                      },
                      barrierColor:
                          Colors.grey.withOpacity(0.5), // พื้นหลังโปร่งใสสีเทา
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.add_circle_outline,
                      color: Color.fromARGB(255, 79, 108, 78),
                    ),
                  ),
                ),
              ),
            ],
          ),
          FriendList(),
        ],
      ),
    );
  }
}
