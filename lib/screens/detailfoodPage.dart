import 'package:flutter/material.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/detailfoodWidget.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/icon_fav.dart';
import 'package:projectapp/widget/icon_share.dart';
import 'package:projectapp/widget/ingredientsWidget.dart';
import 'package:projectapp/widget/widget_support.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projectapp/models/FoodlistModel.dart'; 

class Detailfoodpage extends StatefulWidget {
  final String foodName;
  final String foodId;
  final String foodUrl;

  const Detailfoodpage({super.key, required this.foodName, required this.foodId, required this.foodUrl}); // Modify constructor

  @override
  State<Detailfoodpage> createState() => _DetailfoodpageState();
}

class _DetailfoodpageState extends State<Detailfoodpage> {
  int _selectedIndex = 0;
  List<FoodModel>? foodDetails; // Variable to store food details

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    fetchFoodList(); // Call the fetch function when the state is initialized
    _updatePages(); // Initialize _pages
  }

  @override
  void didUpdateWidget(Detailfoodpage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.foodId != widget.foodId || oldWidget.foodName != widget.foodName) {
      fetchFoodList().then((_) {
        _updatePages(); // Update _pages หลัง fetch สำเร็จ
      });
    }
  }

  void _updatePages() {
    setState(() {
      _pages = [
        Detail(foodId: widget.foodId),
        IngredientsPage(foodId: widget.foodId),
      ];
    });
  }


  Future<void> fetchFoodList() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/Selectfood/${widget.foodName}')); // Use widget.foodName

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        foodDetails = jsonResponse.map((food) => FoodModel.fromJson(food)).toList(); // Store the details
      });
    } else {
      throw Exception('Failed to load food detail');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 214, 181),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.4),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55),
                  topRight: Radius.circular(55),
                ),
              ),
              child: _pages[_selectedIndex], // Show content based on _selectedIndex
            ),
            Container(
              margin: const EdgeInsets.only(top: 70, left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Bottomnav(initialPage:FoodList())));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 79, 108, 78),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(Icons.arrow_back, color: Colors.white,),
                        ),
                      ),
                      const Spacer(),
                      const IconFav(),
                      const SizedBox(width: 10),
                      const IconShare(),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.foodUrl,
                            width: 150,
                            height: 144,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        widget.foodName,
                        style: AppWidget.headlineTextFeildStyle().copyWith(
                          letterSpacing: 0.5,
                          fontSize: 28,
                        ),
                        maxLines: 1, // จำกัดบรรทัดให้เหลือแค่ 1 บรรทัด
                        overflow: TextOverflow.ellipsis, // ใช้ ... เมื่อข้อความยาวเกิน
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: CustomNavBar(onItemTapped: _onItemTapped),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavBar extends StatefulWidget {
  final Function(int) onItemTapped;

  const CustomNavBar({super.key, required this.onItemTapped});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(index); // Notify parent widget about index change
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('Detail', 0),
          _buildNavItem('Ingredients', 1),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 45),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? const Color.fromARGB(255, 240, 214, 181) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.black : const Color.fromARGB(255, 117, 117, 117),
            fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Each topic detail
class Detail extends StatelessWidget {
  final String foodId;

  const Detail({super.key,required this.foodId});

  @override
  Widget build(BuildContext context) {
    return Detailfoodwidget(foodId: foodId);
  }
}

class IngredientsPage extends StatelessWidget {
  final String foodId; // รับ foodId เข้ามา

  const IngredientsPage({super.key, required this.foodId}); // รับ foodId ใน constructor

  @override
  Widget build(BuildContext context) {
    return Ingredientswidget(foodId: foodId);
  }
}
