import 'package:flutter/material.dart';

class IconBack extends StatefulWidget {
  const IconBack({super.key});

  @override
  State<IconBack> createState() => _IconBackState();
}

class _IconBackState extends State<IconBack> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 79, 108, 78),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white,),
      ),
    );
  }
}