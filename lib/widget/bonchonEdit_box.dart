import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class BonchonBox extends StatefulWidget {
  const BonchonBox({super.key});

  @override
  State<BonchonBox> createState() => _BonchonBoxState();
}

class _BonchonBoxState extends State<BonchonBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
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
                  ////Begin --> Stack of Food card Container
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "asset/images/bonchon_wing.png",
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
                                "Calorie : 850 cal • 10 pieces/set",
                                style: AppWidget.verylightTextFeildStyle()
                                    .copyWith(height: 1.3, fontSize: 13),
                              ),
                              Text(
                                "Bonchon Wings",
                                style: AppWidget.semiBoldTextFeildStyle()
                                    .copyWith(
                                        height: 1.3,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Fried Food | Korean Food",
                                style: AppWidget.verylightTextFeildStyle()
                                    .copyWith(height: 1.3, fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 12.0,
                      child: Icon(Icons.edit_square),
                    ),
                  ],
                ), ////End --> Stack of Food card Container
              ),
              Positioned(
                top: 5,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFF4F6C4E),
                  ),
                  child:
                      Text('x1', style: AppWidget.foodquantityTextFeildStyle()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
