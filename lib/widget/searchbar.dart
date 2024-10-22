import 'package:flutter/material.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/screens/foodrecommendationSelect.dart';
import 'package:projectapp/widget/bottomnav.dart';
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
      padding: const EdgeInsets.only(left: 25, right: 2),
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
        decoration: InputDecoration(
          hintText: 'Search for Foods',
          hintStyle: AppWidget.verylightTextFeildStyle(),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          suffixIcon: GestureDetector(
            //link to food list
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Bottomnav(initialPage: FoodList())));
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 79, 108, 78),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
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
