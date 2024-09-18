import 'package:flutter/material.dart';
import 'package:projectapp/screens/detailfoodPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/icon_back.dart';

import 'package:projectapp/widget/searchbar.dart';
import 'package:projectapp/widget/widget_support.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
           decoration: const BoxDecoration(color: Color.fromARGB(255, 252, 245, 236)),
           height: MediaQuery.of(context).size.height,
           child: Container(
              margin: const EdgeInsets.only(top: 50, left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconBack(),
                  SizedBox(height: 10,),
                  Searchbar(),
                  SizedBox(height: 10,),
                  Text("Foods",style: AppWidget.topicTextFeildStyle(),),
                  //* all list
                  Column(
                    children: [
                      //* a list
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnav(initialPage:Detailfoodpage())));},
                        child: Container(
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
                      ),
                    ],
                  )
                ],
              ),
           ),
        ),
      ),
    );
  }
} 