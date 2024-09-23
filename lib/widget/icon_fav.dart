import 'package:flutter/material.dart';

class IconFav extends StatefulWidget {
  const IconFav({super.key});

  @override
  State<IconFav> createState() => _IconFavState();
}

class _IconFavState extends State<IconFav> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
       
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 199, 55),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.favorite, color: Colors.black,),
      ),
    );
  }
}