import 'package:flutter/material.dart';
import 'package:projectapp/widget/widget_support.dart';

class MoreOpt extends StatefulWidget {
  final Function(List<String>) onOptionsSelected;
  final List<String> currentSelections; // New parameter for current selections

  const MoreOpt({
    super.key,
    required this.onOptionsSelected,
    required this.currentSelections, // Include new parameter
  });

  @override
  State<MoreOpt> createState() => _MoreOptState();
}

class _MoreOptState extends State<MoreOpt> {
  // Temporary list to store the selected options before confirmation
  List<String> tempSelectedOptions = []; // Only use this to manage temporary selections

  // Example lists of options
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
    'Cheese & Dairy',
    'Eggs',
    'Chicken & Poultry',
    'Fish & Seafood',
    'Fruit',
    'Lamb',
    'Pork',
    'Rice & Grains',
    'Vegetables'
  ];

  @override
  void initState() {
    super.initState();
    // Initialize tempSelectedOptions with the current selections
    tempSelectedOptions = List.from(widget.currentSelections);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: 396,
        decoration: const BoxDecoration(
          color: Color(0xFFFCF5EC),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Begin
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
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              // Filters Section Begin
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFilterSection(
                          'Food Nationality', foodNationalities),
                      _buildFilterSection('Meals', meals),
                      _buildFilterSection('Food Type', foodType),
                      _buildFilterSection('Cooking Method', cookingMethod),
                      _buildFilterSection('Main Ingredients', mainIngredient),
                    ],
                  ),
                ),
              ),

              // Confirm Button, show only if there's something in tempSelectedOptions
              if (tempSelectedOptions.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: 160,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.onOptionsSelected([]); 
                                tempSelectedOptions.clear();
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFFFFFFF)),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xFFEF3B4F)),
                              shape: WidgetStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Change button border radius
                                ),
                              ),
                            ),
                            child: const Text('Clear All')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.onOptionsSelected(List.from(tempSelectedOptions));
                            });
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF4F6C4E)),
                            foregroundColor:WidgetStateProperty.all<Color>(Colors.white),
                            shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Change button border radius
                              ),
                            ),
                          ),
                          child: const Text('Apply Filter'),
                        ),
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

  // Function to build filter sections
  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppWidget.boldTextFeildStyle()),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0, // Horizontal space between options
          runSpacing: 8.0, // Vertical space between rows of options
          children: options.map((option) {
            bool isSelected = tempSelectedOptions.contains(option);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    tempSelectedOptions.remove(option);
                  } else {
                    tempSelectedOptions.add(option);
                  }
                });
              },
              child: FilterOption(
                label: option,
                isSelected: isSelected,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// Filter Option Widget
class FilterOption extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterOption(
      {super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF1C737) : const Color(0xFFFFF0DE),
        borderRadius: BorderRadius.circular(20.0),
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
