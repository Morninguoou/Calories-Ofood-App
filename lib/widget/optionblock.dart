import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/screens/addmoreOption.dart';

class Optionblock extends StatefulWidget {
  const Optionblock({super.key});

  @override
  State<Optionblock> createState() => _OptionblockState();
}

class _OptionblockState extends State<Optionblock> {
  List<String> selectedOptions = [];

  void updateSelectedOptions(List<String> options) {
    setState(() {
      selectedOptions = options;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                //TODO:link to add option
                onTap: (){},
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical:4),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 240, 222),borderRadius: BorderRadius.circular(20),),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Add Options", style: AppWidget.optionTextFeildStyle(),),
                      const SizedBox(width: 8),
                      const Icon(Icons.close ,size:15, color: Colors.red,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
              //TODO:link to add option
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MoreOpt(onOptionsSelected: updateSelectedOptions,)));},
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 240, 222),borderRadius: BorderRadius.circular(20),),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Add Options", style: AppWidget.optionTextFeildStyle(),),
                      const SizedBox(width: 8),
                      const Icon(Icons.add,size:15, color: Colors.green,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
        ],),
    );
  }
}