import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Notification', style: AppWidget.boldTextFeildStyle().copyWith(fontSize: 31),),
      ),
    );
  }
}