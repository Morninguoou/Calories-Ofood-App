import 'package:flutter/material.dart';

import 'package:projectapp/widget/detailfoodWidget.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/icon_fav.dart';
import 'package:projectapp/widget/icon_share.dart';
import 'package:projectapp/widget/ingredientsWidget.dart';
import 'package:projectapp/widget/widget_support.dart';

class Detailfoodpage extends StatefulWidget {
  const Detailfoodpage({super.key});

  @override
  State<Detailfoodpage> createState() => _DetailfoodpageState();
}

class _DetailfoodpageState extends State<Detailfoodpage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Detail(),
    const IngredientsPage(),
  ];

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
              child: _pages[_selectedIndex], // แสดงผลตาม _selectedIndex
            ),
            Container(
              margin: const EdgeInsets.only(top: 70, left: 30, right: 30),
              child: Column(
                children: [
                  const Row(
                    children: [
                      IconBack(),
                      Spacer(),
                      IconFav(),
                      SizedBox(width: 10),
                      IconShare(),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "asset/images/bonchon_wing.png",
                            width: 150,
                            height: 144,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Bonchon Chicken",
                        style: AppWidget.headlineTextFeildStyle().copyWith(
                          letterSpacing: 0.5,
                          fontSize: 28,
                        ),
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
    widget.onItemTapped(index); // แจ้ง StatefulWidget ว่ามีการเปลี่ยนแปลง index
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

// each topic detail
class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Detailfoodwidget();
  }
}

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Ingredientswidget(); 
  }
}
