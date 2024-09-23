import 'package:flutter/material.dart';
import 'package:projectapp/screens/dailycaloriesPage.dart';
import 'package:projectapp/widget/bottomnav.dart';
import 'package:projectapp/widget/icon_close.dart';
import 'package:projectapp/widget/widget_support.dart';

class Detailfoodwidget extends StatefulWidget {
  const Detailfoodwidget({super.key});

  @override
  State<Detailfoodwidget> createState() => _DetailfoodwidgetState();
}

class _DetailfoodwidgetState extends State<Detailfoodwidget> {
  bool _showAdditionalButtons = false;

  void _toggleAdditionalButtons() {
    setState(() {
      _showAdditionalButtons = !_showAdditionalButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 100, left: 60, right: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Colories", style: AppWidget.headlineTextFeildStyle(),),
                    Text("850", style: AppWidget.headlineTextFeildStyle(),)
                  ],
                ),
                const Divider(color: Color.fromARGB(255, 160, 160, 160), thickness: 3,),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Text("Fat", style: AppWidget.boldTextFeildStyle(),),
                    const Spacer(),
                    Text("54", style: AppWidget.boldTextFeildStyle(),),
                    const SizedBox(width: 5,),
                    Text("g.", style: AppWidget.boldTextFeildStyle(),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Carbohydrate", style: AppWidget.boldTextFeildStyle(),),
                    const Spacer(),
                    Text("18", style: AppWidget.boldTextFeildStyle(),),
                    const SizedBox(width: 5,),
                    Text("g.", style: AppWidget.boldTextFeildStyle(),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Protein", style: AppWidget.boldTextFeildStyle(),),
                    const Spacer(),
                    Text("56", style: AppWidget.boldTextFeildStyle(),),
                    const SizedBox(width: 5,),
                    Text("g.", style: AppWidget.boldTextFeildStyle(),),
                  ],
                ),
                const SizedBox(height: 20,),
                const Divider(color: Color.fromARGB(255, 160, 160, 160), thickness: 3,),
                const SizedBox(height: 25,),
                Center(
                  child: GestureDetector(
                    onTap: _toggleAdditionalButtons,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 79, 108, 78),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Add",
                        style: AppWidget.semiBoldTextFeildStyle().copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_showAdditionalButtons)
          Positioned(
            top: 220,
            right: 20,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showPlannerOptions(context,["dsfadf","dgaagsa","dogafjdg","dsfadf","dgaagsa","dogafjdg"]);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 79, 108, 78),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("To Calculate Cal",style: AppWidget.lightTextFeildStyle().copyWith(color: Colors.white),)
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Bottomnav(initialPage:Dailycalories())));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 79, 108, 78),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("To Exist Planner",style: AppWidget.lightTextFeildStyle().copyWith(color: Colors.white),)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}


void _showPlannerOptions(BuildContext context, List<String> plannerNames) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PlannerOptionsDialog(plannerNames: plannerNames);
    },
  );
}

class PlannerOptionsDialog extends StatefulWidget {
  final List<String> plannerNames;

  const PlannerOptionsDialog({required this.plannerNames});

  @override
  _PlannerOptionsDialogState createState() => _PlannerOptionsDialogState();
}

class _PlannerOptionsDialogState extends State<PlannerOptionsDialog> {
  final Map<String, bool> _expanded = {};
  final Set<String> _selectedMeals = {};

  @override
  void initState() {
    super.initState();
    for (var name in widget.plannerNames) {
      _expanded[name] = false;
    }
  }

  void _toggleExpand(String name) {
    setState(() {
      _expanded[name] = !_expanded[name]!;
    });
  }

  void _toggleMealSelection(String meal) {
    setState(() {
      if (_selectedMeals.contains(meal)) {
        _selectedMeals.remove(meal);
      } else {
        _selectedMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 214, 181),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 60),
            Text('Select Planner', style: AppWidget.semiBoldTextFeildStyle()),
            const Spacer(),
            const IconClose()
          ],
        ),
      ),
      content: SizedBox(
        height: 270,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.plannerNames.isNotEmpty
                ? widget.plannerNames.map((item) => SingleChildScrollView(
                  child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _toggleExpand(item);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 6),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 79, 108, 78),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item, style: AppWidget.lightTextFeildStyle().copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18)),
                                  Icon(
                                    _expanded[item]! ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_expanded[item]!)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 79, 108, 78).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(children: [
                              Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    _toggleMealSelection("Breakfast");
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: _selectedMeals.contains("Breakfast") ? const Color.fromARGB(255, 240, 214, 181) :  const Color.fromARGB(255, 187, 207, 63),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Text("Breakfast", style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 15))
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _toggleMealSelection("Lunch");
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 2),
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: _selectedMeals.contains("Lunch") ? const Color.fromARGB(255, 240, 214, 181) : const Color.fromARGB(255, 232, 235, 80),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Text("Lunch", style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 15)),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _toggleMealSelection("Dinner");
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: _selectedMeals.contains("Dinner") ? const Color.fromARGB(255, 240, 214, 181) : const Color.fromARGB(255, 243, 164, 12),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text("Dinner", style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 15)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _toggleMealSelection("Other");
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color:_selectedMeals.contains("Other") ? const Color.fromARGB(255, 240, 214, 181) : const Color.fromARGB(255, 206, 134, 239),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text("Other", style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 15)),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                      ],
                    ),
                )).toList()
                : [
                    Column(children: [
                      Text("No Planner Found",style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600),),
                      Text("Please try create one",style: AppWidget.optionTextFeildStyle().copyWith(color: Colors.black, fontWeight: FontWeight.w500),),
                      const SizedBox(height: 30,),
                      Image.asset("asset/images/iconSadSearch.png", width: 160, height: 160,)
                    ],),
                  ],
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.all(0),
      actions: [
        Container(
          child: !_selectedMeals.isEmpty
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 39,vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 214, 181),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 73,vertical: 10), // Add some padding for the button
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 79, 108, 78),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        "Confirm",
                        style: AppWidget.semiBoldTextFeildStyle().copyWith(color: Colors.white, fontSize: 15),
                      ),
                    ),
                ),
            )
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 214, 181),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
              ), // Empty space if _selectedMeals is null
        ),
      ],
    );
  }
}
