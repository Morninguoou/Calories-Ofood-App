import 'package:flutter/material.dart';
import 'package:projectapp/screens/foodlistPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/feature_box.dart';
import 'package:projectapp/widget/icon_chat.dart';
import 'package:projectapp/widget/optionblock.dart';

import 'package:projectapp/widget/searchbar.dart';
import 'package:projectapp/widget/widget_support.dart';


class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 252, 245, 236)),
          child: Container(
            margin: const EdgeInsets.only(top: 50, left: 20,right: 20),
            child: 
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Hi, Thursday",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    IconChat(),
                ],),
                SizedBox(height: 10,),
                Searchbar(),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 214, 181),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: 
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Transform(
                                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                                    alignment: Alignment.center,
                                    child: Image.asset("asset/images/mainfood.png",height: 45,)
                                  )
                                ),
                              ),
                              SizedBox(width: 10,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("\"Do you want us to help you quickly",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text("recommend food?\"",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Optionblock(),
                          GestureDetector(
                            // TODOTap to ranmdom food
                            onTap: (){
        
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 79, 108, 78),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow( color: Colors.black.withOpacity(0.3), spreadRadius: 1, blurRadius: 3, offset: Offset(0, 3),),
                                ],
                              ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.thumb_up_alt_outlined,color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text("Random Food" ,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',),
                                    )
                                ],),
                              ),
                          )
                        ],
                      ),
                    ),
                ),
                FeatureBox(),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Foods",
                      style: AppWidget.topicTextFeildStyle(),  
                    ),
                    GestureDetector(
                      //TODOTap to food page
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnav(initialPage:FoodList())));
                      },
                      child: Text("See All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 79, 108, 78),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),),
                    )
                  ],
                ),
                Column(
                  children: [
                    //* a list
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("asset/images/bonchon_wing.png",height: 67, width: 78,fit: BoxFit.cover,)
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Calorie : 850 cal • 10 pieces/set", style: AppWidget.verylightTextFeildStyle().copyWith(height: 1.3,fontSize: 13),),
                                Text("Bonchon Wings", style: AppWidget.semiBoldTextFeildStyle().copyWith(height: 1.3,fontWeight: FontWeight.bold),),
                                Text("Fried Food | Korean Food", style: AppWidget.verylightTextFeildStyle().copyWith(height: 1.3,fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("asset/images/bonchon_wing.png",height: 67, width: 78,fit: BoxFit.cover,)
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Calorie : 850 cal • 10 pieces/set", style: AppWidget.verylightTextFeildStyle().copyWith(height: 1.3,fontSize: 13),),
                                Text("Bonchon Wings", style: AppWidget.semiBoldTextFeildStyle().copyWith(height: 1.3,fontWeight: FontWeight.bold),),
                                Text("Fried Food | Korean Food", style: AppWidget.verylightTextFeildStyle().copyWith(height: 1.3,fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],),
          ),
        ),
      ),
    );
  }
}
