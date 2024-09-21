import 'dart:ffi';

import 'package:flutter/material.dart';

class PlannerMain extends StatefulWidget {
  const PlannerMain({super.key});

  @override
  State<PlannerMain> createState() => _PlannerMainState();
}

class _PlannerMainState extends State<PlannerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D6B5), //F9F9F9
      appBar: AppBar(
        title: const Text('Meal Plan'),
        backgroundColor: Color(0xFFF0D6B5),
        titleTextStyle: TextStyle(
          fontSize: 36.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              height: 656.0,
              child: Expanded(
                // Use Expanded to make the ListView take the remaining space
                child: ListView.builder(
                  itemCount: 9, // Number of items to display
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('Task ${index + 1}'),
                        subtitle: Text('Details of Task \n ${index + 1}'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Function when button is pressed
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
