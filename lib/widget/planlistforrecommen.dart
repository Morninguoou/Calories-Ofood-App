// import 'package:flutter/material.dart';
// import 'package:projectapp/screens/foodrecommendationPlanDetail.dart';
// import 'package:projectapp/widget/bottomnav.dart';
// import 'package:projectapp/widget/widget_support.dart';

// class Planlist extends StatefulWidget {
//   const Planlist({super.key});

//   @override
//   State<Planlist> createState() => _PlanlistState();
// }

// class _PlanlistState extends State<Planlist> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 'Date : Sunday, 18 August',
//                 style: AppWidget.dateboldTextFeildStyle(),
//               ),
//               SizedBox(width: 8.0),
//               Icon(Icons.calendar_today_outlined, size: 18),
//             ],
//           ),
//           SizedBox(height: 16.0),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Breakfast : Pork Congee'),
//               SizedBox(height: 8.0),
//               Text('Lunch : Thai Basil Chicken'),
//               SizedBox(height: 8.0),
//               Text('Dinner : Salad Roll, Dutchie Original Yoghurt'),
//             ],
//           ),
//           SizedBox(height: 10),
//           Divider(color: Colors.grey[300]),
//           SizedBox(height: 8.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Total Calories : 1448 cal',
//                   style: AppWidget.totalcalTextFeildStyle()),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Bottomnav(
//                         initialPage: FoodRecommendationPlanDetail(),
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'More Details',
//                   style: AppWidget.moredetailTextFeildStyle(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
