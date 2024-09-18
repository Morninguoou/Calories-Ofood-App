import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Ingredientswidget extends StatefulWidget {
  const Ingredientswidget({super.key});

  @override
  State<Ingredientswidget> createState() => _IngredientswidgetState();
}

class _IngredientswidgetState extends State<Ingredientswidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80,left: 40, right: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Text("Food quantity", style: AppWidget.boldTextFeildStyle(),),),
              Container(child: 
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 79, 108, 78),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.remove, color: Colors.white, size: 18,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 17,vertical: 2),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 217, 217, 217), 
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("1",style: AppWidget.boldTextFeildStyle(),),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 79, 108, 78), 
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 18,),
                    ),
                ],),
              )
            ],
          )
        ],
      )
    );
  }
}