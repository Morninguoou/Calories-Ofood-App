import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class BonchonBox extends StatefulWidget {
  const BonchonBox({super.key});

  @override
  State<BonchonBox> createState() => _BonchonBoxState();
}

class _BonchonBoxState extends State<BonchonBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
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
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Calorie : 850 cal • 10 pieces/set",
                  style: AppWidget.verylightTextFeildStyle()
                      .copyWith(height: 1.3, fontSize: 13),
                ),
                Text(
                  "Bonchon Wings",
                  style: AppWidget.semiBoldTextFeildStyle()
                      .copyWith(height: 1.3, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Fried Food | Korean Food",
                  style: AppWidget.verylightTextFeildStyle()
                      .copyWith(height: 1.3, fontSize: 13),
                ),
              ],
            ),
            Positioned(
                bottom: 5.0, right: 40.0, child: Icon(Icons.edit_square)),
          ],
        ),
      ),
    );
  }
}
