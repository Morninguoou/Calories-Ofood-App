import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:projectapp/screens/mainPage.dart';
import 'package:projectapp/screens/plannermainPage.dart';
import 'package:projectapp/screens/dailycaloriesPage.dart';
import 'package:projectapp/screens/notificationPage.dart';
import 'package:projectapp/screens/myprofilePage.dart';



class Bottomnav extends StatefulWidget {
  final Widget initialPage;

  const Bottomnav({super.key, required this.initialPage});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      Mainpage(),
      PlannerMain(),
      Dailycalories(),
      Noti(),
      Myprofile(),
      widget.initialPage,
    ];
    currentTabIndex = pages.indexOf(widget.initialPage);
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTabIndex,
        children: pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: const Color.fromARGB(255, 252, 245, 236),
        color: const Color.fromARGB(255, 79, 108, 78),
        animationDuration: const Duration(milliseconds: 500),
        onTap: _onItemTapped,
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.event_available_outlined, color: Colors.white),
          Icon(Icons.fastfood_outlined, color: Colors.white),
          Icon(Icons.notifications_active_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
    );
  }
}
