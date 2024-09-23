import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class FeatureBox extends StatefulWidget {
  const FeatureBox({super.key});

  @override
  State<FeatureBox> createState() => _FeatureBoxState();
}

class _FeatureBoxState extends State<FeatureBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column( children: [
        Row(children: [
          Text("Looking to manage your weught?", style: AppWidget.verylightTextFeildStyle(),),
          const SizedBox(width: 5,),
          const Text("Try using",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            )
          )
        ],),
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("this features!",
                style: AppWidget.topicTextFeildStyle()
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 199, 55),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: 
                  Column(children: [
                    Image.asset("asset/images/mainleftfeature.png",width: 60, height: 60,),
                    const SizedBox(height: 6,),
                    Text("Calorie Calculation", 
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        //! letterSpacing: 0.5,
                        shadows: [
                          Shadow(
                            offset: const Offset(2.0, 2.0), // ระยะทางของเงาจากข้อความ
                            blurRadius: 3.0,           // ระดับความเบลอของเงา
                            color: Colors.grey.withOpacity(0.5), // สีของเงา
                          ),
                        ],
                      ),
                    )
                  ],)
              ,)
          ],),
          const SizedBox(width: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 199, 55),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: 
              Column(
                children: [
                  Image.asset("asset/images/mainrightfeature.png", width: 60, height: 60,),
                  const SizedBox(height: 6,),
                  Text("Food",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      //! letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          offset: const Offset(2.0, 2.0), // ระยะทางของเงาจากข้อความ
                          blurRadius: 3.0,           // ระดับความเบลอของเงา
                          color: Colors.grey.withOpacity(0.5), // สีของเงา
                        ),
                      ],
                    ),  
                  ),
                  Text("Recommendation",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      //! letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          offset: const Offset(2.0, 2.0), // ระยะทางของเงาจากข้อความ
                          blurRadius: 3.0,           // ระดับความเบลอของเงา
                          color: Colors.grey.withOpacity(0.5), // สีของเงา
                        ),
                      ],
                    ),  
                  )
                ],
              )
          ,)
        ],)
      ],),
    );
  }
}