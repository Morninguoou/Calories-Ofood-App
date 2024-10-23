import 'package:flutter/material.dart';
import 'package:projectapp/screens/loginPage.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/api/authentication.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
  bool _loading = false;
  String _message = '';
  Future<void> _handleSignUp() async {
    setState(() {
      _loading = true;
      _message = '';
    });

    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    setState(() {
      _nameError = _nameController.text.isEmpty ? "Please enter your name" : null;
      _emailError = email.isEmpty ? "Please enter your email" : null;
      _passwordError = password.isEmpty ? "Please enter your password" : null;
      _confirmPasswordError = confirmPassword != password ? "Passwords do not match" : null;
    });
    if (_nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      String result = await AuthService.SignUp(email, password);
      setState(() {
        _message = result;
      });
      if (result.startsWith('Sign-up successful')) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
      }
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 252, 245, 236),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              Text(
                                "Sign up",
                                style: AppWidget.headlineTextFeildStyle(),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: const Icon(Icons.person_outline),
                                  errorText: _nameError,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  errorText: _emailError,
                                ),
                              ),
                              const SizedBox(height: 20),
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
                              TextField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: const Icon(Icons.password_outlined),
                                  errorText: _confirmPasswordError,
                                ),
                              ),
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: _handleSignUp, // Handle the sign-up action
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 245, 185, 92),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: _loading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Center(
                                            child: Text(
                                              "SIGN UP",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                _message, // Show any sign-up result or error message
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 70),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                        },
                        child: Text(
                          "Already have an account? Login",
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
