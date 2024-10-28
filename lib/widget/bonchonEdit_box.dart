import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class BonchonBox extends StatefulWidget {
  final String foodName;
  final int calories;
  final int dish;
  final String imageURL;
  final List<String> foodType;

  const BonchonBox({Key? key, required this.foodName, required this.calories, required this.dish, required this.imageURL, required this.foodType,}) : super(key: key);

  @override
  State<BonchonBox> createState() => _BonchonBoxState();
}

class _BonchonBoxState extends State<BonchonBox> {
  final int maxFoodNameLength = 20;

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
                            child: widget.imageURL.startsWith('http')
                                ? Image.network( // Use Image.network for URLs
                                    widget.imageURL,
                                    height: 67,
                                    width: 78,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset( // Use Image.asset for local assets
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
                                widget.foodType.isNotEmpty ? widget.foodType.join(' | ') : 'No Tags',
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
                      Text('x${widget.dish}', style: AppWidget.foodquantityTextFeildStyle()),
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
      return '${foodName.substring(0, maxFoodNameLength)}...'; // Truncate and add ellipsis
    }
    return foodName; // Return original if within limit
  }
}