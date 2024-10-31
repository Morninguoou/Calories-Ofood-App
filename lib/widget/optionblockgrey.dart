import 'package:flutter/material.dart';
import 'package:projectapp/screens/addmoreOption.dart';
import 'package:projectapp/widget/widget_support.dart';

class Optionblockgrey extends StatefulWidget {
  final List<String> selectedOptions;
  final Function(List<String>) onOptionsSelected;

  const Optionblockgrey({
    super.key,
    required this.selectedOptions,
    required this.onOptionsSelected,
  });

  @override
  State<Optionblockgrey> createState() => _OptionblockgreyState();
}

class _OptionblockgreyState extends State<Optionblockgrey> {
  void _removeOption(String option) {
    setState(() {
      widget.selectedOptions.remove(option);
      widget.onOptionsSelected(widget.selectedOptions);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              // Display the selected options
              Wrap(
                spacing: 8.0,
                children: widget.selectedOptions.map((option) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 240, 222),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            option,
                            style: AppWidget.optionTextFeildStyle(),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              _removeOption(option);
                            },
                            child: Icon(
                              Icons.close,
                              size: 15,
                              color: Colors.red,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreOpt(
                        onOptionsSelected: (options) {
                          setState(() {
                            widget.onOptionsSelected(options);
                          });                        
                        },
                        currentSelections: widget.selectedOptions,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 240, 222),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add Options",
                        style: AppWidget.optionTextFeildStyle(),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
