import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

import 'package:projectapp/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: 
        Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                Color.fromARGB(255, 79, 108, 78),
                Color.fromARGB(255, 99, 136, 98),
              ])
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 252, 245, 236), 
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70))
              ),
            child:
              Text(""),
          ),
          Container(
            margin: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(children: [
              Center(child: Image.asset("asset/images/logo.png", width: MediaQuery.of(context).size.width/1.2,fit: BoxFit.cover,)),
              const SizedBox(height: 50,),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child:
                    Column(children: [
                      const SizedBox(height: 40,),
                      Text("Login", style: AppWidget.headlineTextFeildStyle(),),
                      const SizedBox(height: 30,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: AppWidget.semiBoldTextFeildStyle(),
                          prefixIcon: const Icon(Icons.email_outlined) 
                        ),
                      ),
                      const SizedBox(height: 30,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: AppWidget.semiBoldTextFeildStyle(),
                          prefixIcon: const Icon(Icons.password_outlined) 
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text("Forgot Password?",style: AppWidget.lightTextFeildStyle(),)
                      ),
                      const SizedBox(height: 70,),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          width: 200,
                          decoration: BoxDecoration(color: const Color.fromARGB(255, 245, 185, 92),borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                              )
                            )
                        ),
                      ),
                    ],),
                ),
              ),
              SizedBox(height: 70,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text("Don't have an account? Join now.",style: AppWidget.semiBoldTextFeildStyle(),)
              )
            ],),
          ),
        ],)
      ,),
    );
}
}