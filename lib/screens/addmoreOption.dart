import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class MoreOpt extends StatefulWidget {
  const MoreOpt({super.key});

  @override
  State<MoreOpt> createState() => _MoreOptState();
}

class _MoreOptState extends State<MoreOpt> {
  // List of selected options to store the state of the filters
  List<String> selectedOptions = [];

  // Example list of food nationalities
  List<String> foodNationalities = [
    'Thai Food',
    'French Food',
    'Chinese Food',
    'Japanese Food',
    'Italian Food',
    'Spanish Food',
    'American Food',
    'Mexican Food',
    'Indian Food',
    'Turkey Food'
  ];
  List<String> meals = [
    'breakfast',
    'brunch',
    'lunch',
    'afternoon tea',
    'dinner'
  ];
  List<String> foodType = ['Main Dishes', 'Snacks/Desserts', 'Beverages'];
  List<String> cookingMethod = ['Grilled/Baked', 'Fried', 'Steamed/Boiled'];
  List<String> mainIngredient = [
    'Beans&Legumes',
    'Beef & Veal',
    'Cheese & Diary',
    'Eggs',
    'Chicken & Poultry',
    'Fish & Seafood',
    'Fruit',
    'Lamb',
    'Pork',
    'Rice & Grains',
    'Vegetables'
  ];
  List<String> calories = ['low calorie', 'Moderate-calorie', 'high calorie'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 765,
        width: 396,
        decoration: BoxDecoration(
          color: Color(0xFFFCF5EC),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 75),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                /////////Title Begin
                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Options',
                      style:
                          AppWidget.boldTextFeildStyle().copyWith(fontSize: 31),
                    ),
                    Icon(
                      Icons.close,
                      size: 40,
                    ),
                  ],
                ),
              ), /////////Title End

              // Food Nationality Filter
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Food Nationality',
                        style: AppWidget.boldTextFeildStyle()),
                    // Wrapping the options in Wrap for responsiveness
                    Wrap(
                      spacing: 8.0, // Horizontal space between options
                      runSpacing: 8.0, // Vertical space between rows of options
                      children: foodNationalities.map((nationality) {
                        // Each option wrapped in GestureDetector
                        bool isSelected = selectedOptions.contains(nationality);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedOptions.remove(nationality);
                              } else {
                                selectedOptions.add(nationality);
                              }
                            });
                          },
                          child: FilterOption(
                            label: nationality,
                            isSelected: isSelected,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),

                    Text('Meals',
                        style: AppWidget.boldTextFeildStyle()),
                    // Wrapping the options in Wrap for responsiveness
                    Wrap(
                      spacing: 8.0, // Horizontal space between options
                      runSpacing: 8.0, // Vertical space between rows of options
                      children: meals.map((nationality) {
                        // Each option wrapped in GestureDetector
                        bool isSelected = selectedOptions.contains(nationality);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedOptions.remove(nationality);
                              } else {
                                selectedOptions.add(nationality);
                              }
                            });
                          },
                          child: FilterOption(
                            label: nationality,
                            isSelected: isSelected,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),

                    Text('Food Type',
                        style: AppWidget.boldTextFeildStyle()),
                    // Wrapping the options in Wrap for responsiveness
                    Wrap(
                      spacing: 8.0, // Horizontal space between options
                      runSpacing: 8.0, // Vertical space between rows of options
                      children: foodType.map((nationality) {
                        // Each option wrapped in GestureDetector
                        bool isSelected = selectedOptions.contains(nationality);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedOptions.remove(nationality);
                              } else {
                                selectedOptions.add(nationality);
                              }
                            });
                          },
                          child: FilterOption(
                            label: nationality,
                            isSelected: isSelected,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),

                    Text('Cooking Method',
                        style: AppWidget.boldTextFeildStyle()),
                    // Wrapping the options in Wrap for responsiveness
                    Wrap(
                      spacing: 8.0, // Horizontal space between options
                      runSpacing: 8.0, // Vertical space between rows of options
                      children: cookingMethod.map((nationality) {
                        // Each option wrapped in GestureDetector
                        bool isSelected = selectedOptions.contains(nationality);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedOptions.remove(nationality);
                              } else {
                                selectedOptions.add(nationality);
                              }
                            });
                          },
                          child: FilterOption(
                            label: nationality,
                            isSelected: isSelected,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),

                    Text('Main Ingredients',
                        style: AppWidget.boldTextFeildStyle()),
                    // Wrapping the options in Wrap for responsiveness
                    Wrap(
                      spacing: 8.0, // Horizontal space between options
                      runSpacing: 8.0, // Vertical space between rows of options
                      children: mainIngredient.map((nationality) {
                        // Each option wrapped in GestureDetector
                        bool isSelected = selectedOptions.contains(nationality);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedOptions.remove(nationality);
                              } else {
                                selectedOptions.add(nationality);
                              }
                            });
                          },
                          child: FilterOption(
                            label: nationality,
                            isSelected: isSelected,
                          ),
                        );
                      }).toList(),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Filter Option Widget with customizable appearance based on selection
class FilterOption extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterOption({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFF1C737) : Color(0xFFFFF0DE),
        borderRadius: BorderRadius.circular(20.0),
        //border: Border.all(color: isSelected ? Color(0xFFF1C737) : Color(0xFFFFF0DE)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Color(0xFF757575),
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }

}
