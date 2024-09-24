import 'package:flutter/material.dart';

class IconShare extends StatefulWidget {
  const IconShare({super.key});

  @override
  State<IconShare> createState() => _IconShareState();
}

class _IconShareState extends State<IconShare> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
       
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.share_outlined, color: Colors.black,),
      ),
    );
  }
}