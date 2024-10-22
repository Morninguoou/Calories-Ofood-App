import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 396,
      decoration: BoxDecoration(
        color: Color(0xFFFCF5EC),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 40),
        decoration: BoxDecoration(
          color: Color(0xFFFCF5EC),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification',
              style: AppWidget.boldTextFeildStyle().copyWith(fontSize: 31),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
              "asset/images/no notification.png",
            ),
            ),
            

          ],
        ),
      ),
    );
  }
}
