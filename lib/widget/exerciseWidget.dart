import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Exercisewidget extends StatefulWidget {
  const Exercisewidget({super.key});

  @override
  State<Exercisewidget> createState() => _ExercisewidgetState();
}

class _ExercisewidgetState extends State<Exercisewidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100,left: 40, right: 40,bottom: 30),
      child: Container(
        height:200,
        decoration: BoxDecoration(color: Color.fromARGB(255, 240, 214, 181), borderRadius: BorderRadius.circular(20)),
        child: 
          ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              buildCard('Pool Swim', '500 m'),
              buildCard('Pool Swim', '500 m'),
              buildCard('Pool Swim', '500 m'),
              buildCard('Pool Swim', '500 m'),

            ]
          )
      ,)
    );
  }
}

Widget buildCard(String activity, String distance) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 5),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.pool, color: Color.fromARGB(255, 241, 199, 55), size: 70,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(activity, style: AppWidget.headlineTextFeildStyle().copyWith(letterSpacing: 1),),
              Text(distance, style: AppWidget.headlineTextFeildStyle().copyWith(color: Color.fromARGB(255, 117, 117, 117),letterSpacing: 1),),
            ],
          ),
        ],
      ),
    ),
  );
}
