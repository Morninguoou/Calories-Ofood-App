import 'package:flutter/material.dart';
import 'package:projectapp/screens/friendrequests.dart';
import 'package:projectapp/screens/mealplanPage.dart';
import 'package:projectapp/widget/friendreqinProfilePage.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/screens/editprofilePage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/mealplaninProfilePage.dart';
import 'package:projectapp/api/authentication.dart';
import 'package:projectapp/api/users.dart'; // Import UserService
import 'package:provider/provider.dart';
import 'package:projectapp/providers/session_provider.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  String name = '';
  String bio = '';
  String userId = '';
  bool isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    _getUserInfo(); // Call _getUserInfo when the page loads
  }

  Future<void> _getUserInfo() async {
    final sessionProvider = Provider.of<SessionProvider>(context, listen: false);
    String idToken = sessionProvider.idToken;

    Map<String, dynamic> currentUser = await AuthService.getCurrentUser(idToken);
    if (currentUser.containsKey('uid')) {
      userId = currentUser['uid'];
      print('User ID: $userId'); // Print the user ID

      // Fetch user information and populate the fields
      Map<String, dynamic>? userInfo = await UserService.getUserInfo(userId);
      if (userInfo != null) {
        setState(() {
          name = userInfo['Username'] ?? 'Name';
          bio = userInfo['Description'] ?? 'Bio';
        });
      } else {
        print('Failed to get user info.');
      }
    } else {
      print('Failed to retrieve user ID');
    }
    
    setState(() {
      isLoading = false; // Set loading to false after fetching data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5EC),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loader while fetching
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 10, 31, 164),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(name, style: AppWidget.nameTextFeildStyle()),
                          const Text(
                            '23 Friends',
                            style: TextStyle(
                              color: Color(0xFF4F6C4E),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.7,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(bio),
                          GestureDetector(
                            child: Container(
                              width: 140.0,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4F6C4E),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Edit profile ',
                                    style: AppWidget.profilebuttonTextFeildStyle(),
                                  ),
                                  const Icon(
                                    Icons.edit_square,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Bottomnav(initialPage: const EditProfile())));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Plans',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF4F6C4E),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.7,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Container(
                        height: 165,
                        width: 400,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            MealProfile(),
                            MealProfile(),
                            MealProfile(),
                            MealProfile(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Friend Request',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xFF4F6C4E),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.7,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Friendrequests()), 
                                  );
                                },
                                child: Text(
                                  'See more',
                                  style: AppWidget.totalcalTextFeildStyle()
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 165,
                        width: 400,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FriendReqProfile(),
                            FriendReqProfile(),
                            FriendReqProfile(),
                            FriendReqProfile(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
