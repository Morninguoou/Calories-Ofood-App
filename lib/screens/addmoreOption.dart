import 'package:flutter/material.dart';
import 'package:projectapp/screens/mainpage.dart';
import 'package:projectapp/widget/bottomnav.dart';
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

  void clearAllFilters() {
    setState(() {
      selectedOptions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 765,
        width: 396,
        decoration: const BoxDecoration(
          color: Color(0xFFFCF5EC),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(top: 75),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Options',
                      style:
                          AppWidget.boldTextFeildStyle().copyWith(fontSize: 31),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: const Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),

              // Food Nationality Filter
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    const SizedBox(height: 10,),

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
                    const SizedBox(height: 10,),

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
                    const SizedBox(height: 10,),

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
                    const SizedBox(height: 10,),

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
              SizedBox(height: 10,),
              if (selectedOptions.isNotEmpty)
                Container(child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: clearAllFilters,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 55,vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text("Clear All", style: TextStyle(color: Colors.red)),
                        ),
                      ),
                      SizedBox(width: 15,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Bottomnav(initialPage:Mainpage())));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 79, 108, 78),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text("Apply Filter" ,style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
              )     
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

  const FilterOption({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF1C737) : const Color(0xFFFFF0DE),
        borderRadius: BorderRadius.circular(20.0),
        //border: Border.all(color: isSelected ? Color(0xFFF1C737) : Color(0xFFFFF0DE)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : const Color(0xFF757575),
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }

}
