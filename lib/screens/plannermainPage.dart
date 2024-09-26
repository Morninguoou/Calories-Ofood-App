import 'package:flutter/material.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/screens/moredetailPage.dart';
import 'package:projectapp/widget/widget_support.dart';

class PlannerMain extends StatefulWidget {
  const PlannerMain({super.key});

  @override
  State<PlannerMain> createState() => _PlannerMainState();
}

class _PlannerMainState extends State<PlannerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D6B5), // Background color
      appBar: AppBar(
        title: const Text('Meal Plan'),
        backgroundColor: Color(0xFFF0D6B5),
        elevation: 0.0,
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
                color: Color.fromARGB(255, 253, 253, 253),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              height: 656.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView.builder(
                  itemCount: 7, // Number of items to display
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        //border: Border.all(color: Colors.black), // Added border
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Align the text to the top-left
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Plan ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height: 10), // Adds spacing between texts
                                Text(
                                  'Details of Plan ${index + 1}.\n\n',
                                  style: TextStyle(fontSize: 16),
                                ),
                                // Ensure text can wrap properly
                              ],
                            ),
                          ),
                          // Positioned icon in the top-right corner
                          Positioned(
                            top: 5,
                            right: 5,
                            child: Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 50,
                            child: GestureDetector(
                              child: Text(
                                'More Detail',
                                style: AppWidget.moredetailTextFeildStyle(),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Bottomnav(
                                            initialPage: MoreDetailPlanner())));
                              },
                            ),
                          ),
                        ],
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
