import 'package:flutter/material.dart';
import 'package:projectapp/screens/friendrequests.dart';
import 'package:projectapp/screens/mealplanPage.dart';
import 'package:projectapp/widget/friendreqinProfilePage.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/screens/editprofilePage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/mealplaninProfilePage.dart';

class Friendrequestprofile extends StatefulWidget {
  const Friendrequestprofile({super.key});

  @override
  State<Friendrequestprofile> createState() => _FriendrequestprofileState();
}

class _FriendrequestprofileState extends State<Friendrequestprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF5EC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: Color.fromRGBO(240, 214, 181, 1),
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
            children: [
              Container(
                alignment: Alignment.center,
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
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plans',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF4F6C4E),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                    fontFamily: 'Poppins',
                  ),
                ),
                Container(
                  height: 165,
                  width: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MealProfile(),
                      MealProfile(),
                      MealProfile(),
                      MealProfile(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Friend Request',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF4F6C4E),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.7,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Friendrequests()), // เปลี่ยนหน้า
                            );
                          },
                          child: Text(
                            'See more',
                            style: AppWidget.totalcalTextFeildStyle()
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 165,
                  width: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FriendReqProfile(),
                      FriendReqProfile(),
                      FriendReqProfile(),
                      FriendReqProfile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
