import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/screens/editprofilePage.dart';
import 'package:projectapp/widget/bottomnav.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
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
                height: 180.0,
                child: Stack(
                  children: [
                    Container(
                      height: 145.0,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 10, 31, 164),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Color(0xFF000000),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text('Name', style: AppWidget.nameTextFeildStyle()),
                    Text('23 Friends',
                        style: TextStyle(
                          color: Color(0xFF4F6C4E),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.7,
                          fontFamily: 'Poppins',
                        )),
                    Text('Bio'),
                    Text('Bio'),
                    Text('Bio'),
                    GestureDetector(
                      child: Container(
                        width: 140.0,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF4F6C4E),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Edit profile ',
                              style: AppWidget.profilebuttonTextFeildStyle(),
                            ),
                            Icon(
                              Icons.edit_square,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Bottomnav(initialPage: EditProfile())));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text(
                  'Plans',
                  style: TextStyle(
                    color: Color(0xFF4F6C4E),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: 'Poppins',
                  ),
                ),
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "asset/images/bonchon_wing.png",
                              height: 67,
                              width: 78,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Bonchon Wings",
                            style: AppWidget.semiBoldTextFeildStyle().copyWith(
                                height: 1.3, fontWeight: FontWeight.bold),
                          ),
                          Text('Updated today'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
