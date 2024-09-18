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
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 199, 55),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(Icons.favorite, color: Colors.black,),
      ),
    );
  }
}