import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BonchonBox extends StatefulWidget {
  final String foodName;
  final int calories;
  final int dish;
  final String imageURL;
  final List<String> foodType;
  final Function(bool) onEditModeChange;
  //final VoidCallback confirmDishCountCallback;
  final String foodID;

  const BonchonBox({
    Key? key,
    required this.foodName,
    required this.calories,
    required this.dish,
    required this.imageURL,
    required this.foodType,
    required this.onEditModeChange,
    //required this.confirmDishCountCallback,
    required this.foodID,
  }) : super(key: key);

  // void confirmDishCount() {
  //   //confirmDishCountCallback();
  // }

  @override
  State<BonchonBox> createState() => BonchonBoxState();
}

class BonchonBoxState extends State<BonchonBox> {
  final int maxFoodNameLength = 20;
  bool isEditMode = false;
  late int currentDishCount;

  @override
  void initState() {
    super.initState();
    currentDishCount = widget.dish; // Initialize with the initial value
  }

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
      widget.onEditModeChange(isEditMode);
    });
  }

  void incrementDishCount() {
    setState(() {
      currentDishCount++;
    });
  }

  void decrementDishCount() {
    if (currentDishCount > 1) {
      setState(() {
        currentDishCount--;
      });
    }
  }

   void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          backgroundColor: Color(0xFFF0D6B5),
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.red,
            ),
            child: Icon(
              Icons.warning_rounded,
              size: 40,
              color: Colors.black,
            ),
          ),
          content: Text(
            'Are you sure you want to delete?',
            style: AppWidget.nutrientTextFeildStyle().copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF4F6C4E),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Cancel',
                      style: AppWidget.lightTextFeildStyle()
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    deleteFood();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Confirm',
                      style: AppWidget.lightTextFeildStyle()
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteFood() async {
    final response = await http.delete(
      Uri.parse(
          'http://10.0.2.2/delete/food/${widget.foodID}'), // Change to the appropriate foodID if necessary
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print('Food deleted successfully!');
      // Optionally, you can remove the BonchonBox from the UI or notify the user
    } else {
      // Handle error
      print('Failed to delete food: ${response.body}');
    }
  }

  Future<void> confirmDishCount() async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2/food/${widget.foodID}/editDish'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'dish': currentDishCount,
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print('Dish count updated successfully!');
    } else {
      // Handle error
      print('Failed to update dish count: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //height: 100,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: widget.imageURL.startsWith('http')
                                ? Image.network(
                                    widget.imageURL,
                                    height: 67,
                                    width: 78,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    widget.imageURL,
                                    height: 67,
                                    width: 78,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Calorie : ${widget.calories} cal",
                                style: AppWidget.verylightTextFeildStyle()
                                    .copyWith(height: 1.3, fontSize: 13),
                              ),
                              Text(
                                _truncateFoodName(widget.foodName),
                                style: AppWidget.semiBoldTextFeildStyle()
                                    .copyWith(
                                        height: 1.3,
                                        fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                widget.foodType.isNotEmpty
                                    ? widget.foodType.join(' | ')
                                    : 'No Tags',
                                style: AppWidget.verylightTextFeildStyle()
                                    .copyWith(height: 1.3, fontSize: 13),
                              ),

                              if (isEditMode)
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          toggleEditMode();
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                Color(0xFFFFFFFF)),
                                        foregroundColor:
                                            WidgetStateProperty.all<Color>(
                                                Color(0xFFEF3B4F)),
                                        shape: WidgetStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Change button border radius
                                          ),
                                        ),
                                        minimumSize:
                                            WidgetStateProperty.all<Size>(
                                                const Size(70, 25)),
                                      ),
                                      child: const Text('Cancel'),
                                    ),
                                    SizedBox(width: 10,),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          confirmDishCount();
                                          toggleEditMode();
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                Color(0xFF4F6C4E)),
                                        foregroundColor:
                                            WidgetStateProperty.all<Color>(
                                                Colors.white),
                                        shape: WidgetStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Change button border radius
                                          ),
                                        ),
                                        minimumSize:
                                            WidgetStateProperty.all<Size>(
                                                const Size(70, 25)),
                                      ),
                                      child: const Text('Apply'),
                                    ),
                                  ],
                                ),

                            ],
                          ),
                          
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 12.0,
                      child: GestureDetector(
                        onTap: () {
                          if (isEditMode) {
                            showDeleteConfirmationDialog(); // Call delete method when in edit mode
                          } else {
                            toggleEditMode(); // Toggle edit mode if not deleting
                          }
                        },
                        child: Icon(isEditMode
                            ? Icons.delete_forever
                            : Icons.edit_square),
                      ),
                    ),
                    if (isEditMode)
                      Positioned(
                        top: -10,
                        right: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.square_outlined,color: Colors.black),
                                  onPressed: () {
                                    decrementDishCount();
                                    print('Reduce icon clicked');
                                  },
                                ),
                              ],
                            ),
                            
                            // IconButton(
                            //   icon: Icon(Icons.check, color: Colors.green),
                            //   onPressed: () {
                            //     //confirmDishCount(); // Confirm and send update
                            //     toggleEditMode(); // Exit edit mode
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    if (isEditMode)
                      Positioned(
                        top: -10,
                        right: 20,
                        child: IconButton(
                          icon:
                              Icon(Icons.add_box_outlined, color: Colors.black),
                          onPressed: () {
                            incrementDishCount();
                            print('Add icon clicked');
                          },
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFF4F6C4E),
                  ),
                  child: Text(
                    'x${currentDishCount}',
                    style: AppWidget.foodquantityTextFeildStyle().copyWith(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _truncateFoodName(String foodName) {
    if (foodName.length > maxFoodNameLength) {
      return '${foodName.substring(0, maxFoodNameLength)}...';
    }
    return foodName;
  }
}