import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Detailfoodwidget extends StatefulWidget {
  const Detailfoodwidget({super.key});

  @override
  State<Detailfoodwidget> createState() => _DetailfoodwidgetState();
}

class _DetailfoodwidgetState extends State<Detailfoodwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100,left: 60, right: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Colories", style: AppWidget.headlineTextFeildStyle(),),
              Text("850", style: AppWidget.headlineTextFeildStyle(),)
          ],),
          Divider(color: Color.fromARGB(255, 160, 160, 160), thickness: 3,),
          SizedBox(height: 15,),
          Row(
            children: [
              Text("Fat", style: AppWidget.boldTextFeildStyle(),),
              Spacer(),
              Text("54", style: AppWidget.boldTextFeildStyle(),),
              SizedBox(width: 5,),
              Text("g.", style: AppWidget.boldTextFeildStyle(),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Carbohydrate", style: AppWidget.boldTextFeildStyle(),),
              Spacer(),
              Text("18", style: AppWidget.boldTextFeildStyle(),),
              SizedBox(width: 5,),
              Text("g.", style: AppWidget.boldTextFeildStyle(),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Protein", style: AppWidget.boldTextFeildStyle(),),
              Spacer(),
              Text("56", style: AppWidget.boldTextFeildStyle(),),
              SizedBox(width: 5,),
              Text("g.", style: AppWidget.boldTextFeildStyle(),),
            ],
          ),
          SizedBox(height: 20,),
          Divider(color: Color.fromARGB(255, 160, 160, 160), thickness: 3,),
          SizedBox(height: 25,),
          Center(
            child: GestureDetector(
              //TODOpopup to add
              onTap: (){
            
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 70,vertical: 7),
                decoration: BoxDecoration(color: Color.fromARGB(255, 79, 108, 78), borderRadius: BorderRadius.circular(12)),
                child: Text("Add",style: AppWidget.semiBoldTextFeildStyle().copyWith(color: Colors.white)),
              ),
            ),
          )
      ],),
    );
  }
}