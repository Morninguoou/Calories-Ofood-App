import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 25, right: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for Foods',
          hintStyle: AppWidget.verylightTextFeildStyle(),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          suffixIcon: GestureDetector(
            //link to food list
            onTap: (){},
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 79, 108, 78),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.search, // ไอคอนค้นหา
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
