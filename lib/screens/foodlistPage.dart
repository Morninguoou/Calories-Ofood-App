import 'package:flutter/material.dart';
import 'package:projectapp/screens/detailfoodPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/icon_back.dart';
import 'package:projectapp/widget/searchbar.dart';
import 'package:projectapp/widget/widget_support.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projectapp/models/FoodlistModel.dart';// เพิ่ม import ของ FoodModel

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  Future<List<FoodModel>> fetchFoodList() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((food) => FoodModel.fromJson(food)).toList();
    } else {
      throw Exception('Failed to load food list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 252, 245, 236)),
              child: Container(
                margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Searchbar(),
                    const SizedBox(height: 10),
                    Text("Foods", style: AppWidget.topicTextFeildStyle()),
                    FutureBuilder<List<FoodModel>>(
                      future: fetchFoodList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else {
                          final foodList = snapshot.data!;
                          return Column(
                            children: foodList.map((food) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Bottomnav(
                                        initialPage: Detailfoodpage(
                                          foodName: food.name,
                                          foodId: food.foodId,
                                          foodUrl: food.imageUrl,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            food.imageUrl,
                                            height: 67,
                                            width: 78,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Calorie: ${food.calories} cal • ${food.dish} pieces/set",
                                                style: AppWidget.verylightTextFeildStyle().copyWith(height: 1.3, fontSize: 13),
                                                overflow: TextOverflow.ellipsis, // แก้ไข overflow
                                                maxLines: 1,
                                              ),
                                              Text(
                                                food.name,
                                                style: AppWidget.semiBoldTextFeildStyle().copyWith(height: 1.3, fontWeight: FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              Text(
                                                food.tags.join(' | '),
                                                style: AppWidget.verylightTextFeildStyle().copyWith(height: 1.3, fontSize: 13),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            child: IconBack(),
          ),
        ],
      ),
    );
  }
}