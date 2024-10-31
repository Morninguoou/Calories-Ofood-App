import 'package:flutter/material.dart';
import 'package:projectapp/screens/myprofilePage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/api/authentication.dart'; // Import AuthService
import 'package:projectapp/api/users.dart'; // Import UserService
import 'package:provider/provider.dart';
import 'package:projectapp/providers/session_provider.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String userId = '';
  String _originalPassword = '';
  @override
  void initState() {
    super.initState();
    _getUserIdAndInfo();
  }

  Future<void> _getUserIdAndInfo() async {
    final sessionProvider = Provider.of<SessionProvider>(context, listen: false);
    String idToken = sessionProvider.idToken;

    // Get current user ID
    Map<String, dynamic> currentUser = await AuthService.getCurrentUser(idToken);
    
    if (currentUser.containsKey('uid')) {
      userId = currentUser['uid'];
      print('User ID: $userId'); // Print the user ID

      // Fetch user information and populate the fields
      Map<String, dynamic>? userInfo = await UserService.getUserInfo(userId);
      if (userInfo != null) {
        setState(() {
          _nameController.text = userInfo['Username'] ?? '';
          _emailController.text = userInfo['Email'] ?? '';
          _passwordController.text = userInfo['Password'] ?? '';
          _bioController.text = userInfo['Description'] ?? '';
          _ageController.text = userInfo['Age'].toString();
          _heightController.text = userInfo['Height'].toString();
          _weightController.text = userInfo['Weight'].toString();
          _originalPassword = userInfo['Password'];
        });
      } else {
        print('Failed to get user info.');
      }
    } else {
      print('Failed to retrieve user ID');
    }
  }
  Future<void> _saveUserChanges() async {
    // Create a map of updated user information
    Map<String, dynamic> updatedUserInfo = {
      'Username': _nameController.text,
      'Password': _passwordController.text,
      'Description': _bioController.text,
      'Age': int.parse(_ageController.text),
      'Height': int.parse(_heightController.text),
      'Weight': int.parse(_weightController.text),
    };
    String result = await UserService.editUserInfo(userId, updatedUserInfo);
    print(result);
  }
  Future<void> _changePassword() async{
    final sessionProvider = Provider.of<SessionProvider>(context, listen: false);
    String idToken = sessionProvider.idToken;
    String newPassword = _passwordController.text;
    String result = await AuthService.changePassword(idToken, newPassword);
    print(result);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5EC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 180.0,
                  child: Stack(
                    children: [
                      Container(
                        height: 145.0,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 10, 31, 164),
                          image: DecorationImage(
                              image: AssetImage("asset/images/logo.png")),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 60,
                        left: 15,
                        child: IconBack(),
                      ),
                      Positioned(
                        bottom: 28,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: Icon(
                              Icons.add_circle,
                              color: Color(0xFF4F6C4E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 45.0,
                          backgroundImage:
                              AssetImage("asset/images/bonchon_wing.png"),
                        ),
                        Positioned(
                          bottom: -1,
                          right: -1,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.add_circle,
                              color: Color(0xFFF0D6B5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Container(
              //////////////////////////NAME////////////////////////////
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your name',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////EMAIL////////////////////////////
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email (แก้ไม่ได้)',
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////PASSWORD////////////////////////////
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////BIO////////////////////////////
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bio',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _bioController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your bio',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////AGE////////////////////////////
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your age',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////HEIGHT////////////////////////////
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Height',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your height',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //////////////////////////WEIGHT////////////////////////////
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Weight',
                      style: AppWidget.editprofiletitleTextFeildStyle()),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your weight',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            GestureDetector(
              onTap: () {
                _saveUserChanges();
                if (_originalPassword != _passwordController.text){
                  _changePassword();
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Bottomnav(initialPage: Myprofile())));
              },
              child: Container(
                width: 140.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF4F6C4E),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Save Change',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
