import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class FriendReqProfile extends StatefulWidget {
  const FriendReqProfile({super.key});

  @override
  State<FriendReqProfile> createState() => _FriendReqProfileState();
}

class _FriendReqProfileState extends State<FriendReqProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "asset/images/bonchon_wing.png",
                height: 125,
                width: 125,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Bonchon Wings",
              style: AppWidget.semiBoldTextFeildStyle()
                  .copyWith(
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
