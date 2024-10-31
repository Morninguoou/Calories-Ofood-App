import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:projectapp/api/authentication.dart';

import 'package:projectapp/screens/mainPage.dart';
import 'package:projectapp/screens/plannermainPage.dart';
import 'package:projectapp/screens/dailycaloriesPage.dart';
import 'package:projectapp/screens/notificationPage.dart';
import 'package:projectapp/screens/myprofilePage.dart';

import 'package:provider/provider.dart';
import 'package:projectapp/providers/session_provider.dart';

class Bottomnav extends StatefulWidget {
  final Widget initialPage;

  const Bottomnav({super.key, required this.initialPage});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex = 0;
  String userId = '';
  List<Widget>? pages; // Nullable to allow checking if pages is initialized

  Future<void> _getUserIdAndInfo() async {
    final sessionProvider =
        Provider.of<SessionProvider>(context, listen: false);
    String idToken = sessionProvider.idToken;

    // Get current user ID
    Map<String, dynamic> currentUser =
        await AuthService.getCurrentUser(idToken);

    if (currentUser.containsKey('uid')) {
      setState(() {
        userId = currentUser['uid'];
        _initializePages(); // Initialize pages after fetching userId
      });
      print('User ID: $userId');
    } else {
      print('Failed to retrieve user ID');
    }
  }

  void _initializePages() {
    pages = [
      const Mainpage(),

      PlannerMain(userID: userId), // Use fetched userId here
      const Dailycalories(checkPopup: false),

      const Noti(),
      const Myprofile(),
      widget.initialPage,
    ];
    setState(() {
      currentTabIndex = pages!.indexOf(widget.initialPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserIdAndInfo(); // Fetch user ID on init
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator if pages is not yet initialized
    if (pages == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: IndexedStack(
        index: currentTabIndex,
        children: pages!,
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
