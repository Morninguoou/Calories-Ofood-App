import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Optionblockgrey extends StatefulWidget {
  const Optionblockgrey({super.key});

  @override
  State<Optionblockgrey> createState() => _OptionblockgreyState();
}

class _OptionblockgreyState extends State<Optionblockgrey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                //TODO:link to add option
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 240, 222),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add Options",
                        style: AppWidget.optionTextFeildStyle(),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.close,
                        size: 15,
                        color: Colors.red,
                      ),
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
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 240, 222),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add Options",
                        style: AppWidget.optionTextFeildStyle(),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
