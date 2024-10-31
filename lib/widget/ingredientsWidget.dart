import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Ingredientswidget extends StatefulWidget {
  final String foodId;

  const Ingredientswidget({super.key, required this.foodId});

  @override
  State<Ingredientswidget> createState() => _IngredientswidgetState();
}

class _IngredientswidgetState extends State<Ingredientswidget> {
  List<Map<String, String>>? ingredients;
  int quantity = 1;
  bool isLoading = true;
  String errorMessage = '';
  List<TextEditingController> controllers = []; // เพิ่ม List สำหรับเก็บ TextEditingControllers

  void addQuantity() {
    setState(() {
      quantity += 1;
    });
  }

  void subtractQuantity() {
    setState(() {
      quantity = quantity <= 1 ? 1 : quantity - 1;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchIngredients();
  }

  @override
  void dispose() {
    // เคลียร์ controllers เมื่อไม่ใช้แล้ว
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> fetchIngredients() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2/Selectingredient/${widget.foodId}'));
      if (response.statusCode == 200) {
        print(response.body);
        List jsonResponse = json.decode(response.body);
        setState(() {
          ingredients = jsonResponse.map((data) => {
          'name': data['name'].toString(),
          'imageUrl': data['imageUrl'].toString(),
          'gram': data['gram']?.toString() ?? '0',
        }).toList();
          // สร้าง TextEditingControllers สำหรับแต่ละ ingredient
        controllers = List.generate(ingredients!.length, 
          (index) => TextEditingController(text: ingredients![index]['gram']));
        isLoading = false;
        });
      } else {
        throw Exception('Failed to load ingredients');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  Future<void> sendIngredients() async {
    try {
      final ingredientData = ingredients!.asMap().entries.map((entry) {
        final index = entry.key;
        final ingredient = entry.value;
        return {
          "name": ingredient['name'],
          "gram": int.parse(controllers[index].text),
        };
      }).toList();

      final response = await http.post(
        Uri.parse('http://10.0.2.2/Calculation/${widget.foodId}/${quantity}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(ingredientData),
      );

      if (response.statusCode == 200) {
        print('Successfully sent data!');
        print(ingredientData);
      } else {
        print('Failed to send data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 80, left: 40, right: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Food quantity",
                  style: AppWidget.boldTextFeildStyle(),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: subtractQuantity,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 79, 108, 78),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "$quantity",
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                    ),
                    GestureDetector(
                      onTap: addQuantity,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 79, 108, 78),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 220,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 214, 181),
                borderRadius: BorderRadius.circular(20),
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : errorMessage.isNotEmpty
                      ? Center(child: Text(errorMessage))
                      : ingredients != null
                          ? ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: ingredients!.length,
                              itemBuilder: (context, index) {
                                return buildCard(ingredients![index],index);
                              },
                            )
                          : const Center(child: Text('No ingredients found')),
            ),
            GestureDetector(
              onTap: sendIngredients, // เรียกฟังก์ชันส่งข้อมูล
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 55),
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 79, 108, 78),
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
                child: Text(
                  "Apply",
                  style: AppWidget.semiBoldTextFeildStyle().copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard(Map<String, String> ingredient, int index) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              ingredient['imageUrl'] ?? '', // URL ของรูปภาพ
              height: 45,
              width: 45,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error), // กรณีโหลดรูปไม่ได้
            ),
            const SizedBox(width: 10),
            Text(
              ingredient['name'] != null && ingredient['name']!.length > 10
                  ? '${ingredient['name']!.substring(0, 10)}..'
                  : ingredient['name'] ?? '', // ชื่อของวัตถุดิบ
              style: AppWidget.boldTextFeildStyle().copyWith(fontSize: 15,letterSpacing: 0.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  width: 90,
                  height: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controllers[index], // ใช้ controller ที่สร้างไว้
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '${ingredient['gram']}',
                      hintStyle: AppWidget.semiBoldTextFeildStyle(),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Text("g.", style: AppWidget.boldTextFeildStyle()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}