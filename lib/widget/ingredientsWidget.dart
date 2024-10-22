import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class Ingredientswidget extends StatefulWidget {
  const Ingredientswidget({super.key});

  @override
  State<Ingredientswidget> createState() => _IngredientswidgetState();
}

class _IngredientswidgetState extends State<Ingredientswidget> {
  int quantity = 0;

  void addQuantity(){
    setState(() {
      quantity += 1;
    });
  }

  void subtractQuantity(){
    setState(() {
      quantity = quantity <= 0 ? 0 : quantity - 1;
    });
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
                Container(
                  child: Text(
                    "Food quantity",
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                ),
                Container(
                  child: Row(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 2),
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
                  ),
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
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  buildCard('Rice'),
                  buildCard('Chicken'),
                  buildCard('Onion'),
                ],
              ),
            ),
            GestureDetector(
              //TODO->Popup
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 55),
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
                child: Text("Apply",style: AppWidget.semiBoldTextFeildStyle().copyWith(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard(String ingredient) {
    String image = '';
    if (ingredient == 'Rice') {
      image = 'iconrice.png';
    } else if (ingredient == 'Chicken') {
      image = 'iconchicken.png';
    } else if (ingredient == 'Onion') {
      image = 'icononion.png';
    }

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "asset/images/$image",
              height: 45,
              width: 45,
            ),
            const SizedBox(width: 10,),
            Text(
              ingredient,
              style: AppWidget.boldTextFeildStyle().copyWith(letterSpacing: 1),
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
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '10',
                      hintStyle: AppWidget.semiBoldTextFeildStyle(),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 6),
                    ),
                  ),
                ),
                Text("g.", style: AppWidget.boldTextFeildStyle())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
