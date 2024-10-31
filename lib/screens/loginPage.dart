import 'package:flutter/material.dart';
import 'package:projectapp/screens/signupPage.dart';
import 'package:projectapp/screens/mainPage.dart'; // Import your MainPage
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/api/authentication.dart'; // Import your AuthService
import 'package:projectapp/widget/bottomnav.dart';
import 'package:provider/provider.dart';
import 'package:projectapp/providers/session_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  Future<void> _handleSignIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Call the AuthService.signIn function with email and password
    Map<String, dynamic> result = await AuthService.signIn(email, password);
    print(result['status']);
    if (result['status'] == 'success') {
      final sessionProvider = Provider.of<SessionProvider>(context, listen: false);

      // Set the idToken in the session provider
      sessionProvider.setIdToken(result['idToken']);
      print(result['message']);

      showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 214, 181),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 60),
            Text(
              'Login Successful',
              style: AppWidget.semiBoldTextFeildStyle(),
            ),
            const Spacer(),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Welcome back to your partner!',
          style: AppWidget.lightTextFeildStyle().copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bottomnav(initialPage: Mainpage())),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 73, vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 79, 108, 78),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Confirm",
                style: AppWidget.semiBoldTextFeildStyle()
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),],
      );},);
    } else {
      // Handle sign-in failure (display an error message)
      // TODO : เพิ่ม UI แจ้ง user
      print(result['message']);
    }
}

  void _validateInputs() {
    setState(() {
      _emailError = _emailController.text.isEmpty ? "Please Enter Your Email" : null;
      _passwordError = _passwordController.text.isEmpty ? "Please Enter Your Password" : null;
    });

    // If there are no errors, proceed to sign-in
    if (_emailError == null && _passwordError == null) {
      _handleSignIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 79, 108, 78),
                      Color.fromARGB(255, 99, 136, 98),
                    ],
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 252, 245, 236),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70)),
                ),
                child: const Text(""),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70, left: 30, right: 30),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "asset/images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              "Login",
                              style: AppWidget.headlineTextFeildStyle(),
                            ),
                            const SizedBox(height: 30),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                prefixIcon: const Icon(Icons.email_outlined),
                                errorText: _emailError,
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                prefixIcon: const Icon(Icons.password_outlined),
                                errorText: _passwordError,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot Password?",
                                style: AppWidget.lightTextFeildStyle(),
                              ),
                            ),
                            const SizedBox(height: 40),
                            GestureDetector(
                              onTap: _validateInputs,
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 245, 185, 92),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signuppage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: AppWidget.semiBoldTextFeildStyle(),
                          ),
                          Text(
                            " Join now.",
                            style: AppWidget.semiBoldTextFeildStyle().copyWith(color: Color.fromARGB(255, 79, 108, 78)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}