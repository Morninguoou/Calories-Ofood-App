import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_back.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF5EC),
      body: SingleChildScrollView(
        child: Column(
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
                          image: DecorationImage(
                              image: AssetImage("asset/images/logo.png")),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 15,
                        child: IconBack(),
                      ),
                      Positioned(
                        bottom: 28,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: Icon(
                              Icons.add_circle,
                              color: Color(0xFF4F6C4E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 45.0,
                          backgroundImage:
                              AssetImage("asset/images/bonchon_wing.png"),
                        ),
                        Positioned(
                          bottom: -1,
                          right: -1,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add_circle,
                              color: Color(0xFFF0D6B5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Container(
              //////////////////////////NAME////////////////////////////
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 33.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        maxLength: 30,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your name',
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////EMAIL////////////////////////////
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 33.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        maxLength: 30,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email(แก้ไม่ได้)',
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////PASSWORD////////////////////////////
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 33.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////BIO////////////////////////////
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bio',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        maxLines: 3,
                        maxLength: 100,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////EMAIL////////////////////////////
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 33.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        maxLength: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////HEIGHT////////////////////////////
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Height',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 33.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        maxLength: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          counterText: '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////WEIGHT////////////////////////////
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Weight',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 33.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        maxLength: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          counterText: "",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFF4F6C4E),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Save Change',
                      style: AppWidget.profilebuttonTextFeildStyle(),
                    ),
                  ],
                ),
              ),
              //onTap: {},
            ),
          ],
        ),
      ),
    );
  }
}
