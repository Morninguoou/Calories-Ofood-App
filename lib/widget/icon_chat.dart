import 'package:flutter/material.dart';

class IconChat extends StatefulWidget {
  const IconChat({super.key});

  @override
  State<IconChat> createState() => _IconChatState();
}

class _IconChatState extends State<IconChat> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      child: 
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow( color: Colors.black.withOpacity(0.3), spreadRadius: 2, blurRadius: 3, offset: const Offset(0, 4),),
            ],
          ),
          child: const Icon(
            Icons.chat_bubble_outline,
            color: Color.fromARGB(255, 79, 108, 78),
          ),
          alignment: Alignment.center,
        ),
    );
  }
}