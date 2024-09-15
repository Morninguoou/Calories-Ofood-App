import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

import 'package:projectapp/widget/searchbar.dart';


class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 252, 245, 236)),
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20,right: 20),
          child: 
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Hi, Thursday",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    child: 
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow( color: Colors.black.withOpacity(0.3), spreadRadius: 2, blurRadius: 3, offset: Offset(0, 4),),
                          ],
                        ),
                        child: const Icon(
                          Icons.chat_bubble_outline,
                          color: Color.fromARGB(255, 79, 108, 78),
                        ),
                        alignment: Alignment.center,
                      ),
                  )
              ],),
              Searchbar(),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 214, 181),
                  borderRadius: BorderRadius.circular(25),
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
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
//link to add option
                                    onTap: (){},
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical:4),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 240, 222),borderRadius: BorderRadius.circular(20),),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Add Options", style: AppWidget.optionTextFeildStyle(),),
                                          SizedBox(width: 8),
                                          Icon(Icons.close ,size:15, color: Colors.red,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
//link to add option
                                    onTap: (){},
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 240, 222),borderRadius: BorderRadius.circular(20),),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Add Options", style: AppWidget.optionTextFeildStyle(),),
                                          SizedBox(width: 8),
                                          Icon(Icons.add,size:15, color: Colors.green,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              
                            ],),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 79, 108, 78),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow( color: Colors.black.withOpacity(0.3), spreadRadius: 1, blurRadius: 3, offset: Offset(0, 3),),
                            ],
                          ),
                            child: Row(
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
                          )
                      ],
                    ),
                  ),
              )

            ],),
        ),
      ),
    );
  }
}
