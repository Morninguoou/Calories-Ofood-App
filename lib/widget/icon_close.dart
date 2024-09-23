import 'package:flutter/material.dart';

class IconClose extends StatefulWidget {
  const IconClose({super.key});

  @override
  State<IconClose> createState() => _IconCloseState();
}

class _IconCloseState extends State<IconClose> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        child: const Icon(
          Icons.close,
          color: Colors.red,
        ),
      ),
    );
  }
}
