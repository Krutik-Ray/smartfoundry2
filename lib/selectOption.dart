// import 'package:flutter/material.dart';
// import 'package:enhanced_drop_down/enhanced_drop_down.dart';
// import 'main.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   String _selected = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Select the parameter'),
//         ),
//         body:Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: new EnhancedDropDown.withData(
//                   dropdownLabelTitle: "Label",
//                   defaultOptionText: "Select One",
//                   dataSource: parameters,
//                   valueReturned: (chosen) {
//                     _selected = chosen;
//                     print(_selected);
//                   },
//                 ),
//               ),
//               RaisedButton(
//             child: Text(
//               'Go to Plot Screen',
//               style: TextStyle(fontSize: 24),
//             ),
//             onPressed: () {
//               _sendDataToSecondScreen(context);
//             },
//           )]
//         )
//     );
//   }
//   void _sendDataToSecondScreen(BuildContext context) {
//     String textToSend = _selected;
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ChartApp(text: textToSend,),
//         ));
//   }
// }
// List<String> parameters = [
//   "ID",
//   "FLASH",
//   "MISRUN",
//   "CERAMIC_INCLUSION",
//   "SHRINKAGE",
//   "SLAG_INCLUSION",
//   "Metal_Preparation_minutes",
//   "Tapping_Temperature_C",
//   "Time_Taken_for_Injection_sec",
//   "Press_Room_Temperature_C",
//   "Press_Room_Humidity",
//   "Process_Duration_days",
//   "Shell_Weight_before_Dewaxing_kg",
//   "Shell_Weight_after_Dewaxing_kg",
//   "Viscosity_Primary_Slurry_sec",
//   "pH_Primary_Slurry",
//   "Temperature_of_Primary_Coating_Room_C",
//   "Humidity_of_Primary_Coating_Room",
//   "Viscosity_Secondary_Slurry_sec",
//   "pH_Secondary_Slurry",
//   "Temperature_of_Secondary_Coating_Room_C",
//   "Humidity_of_Secondary_Coating_Room",
//   "Nickel_extra",
//   "Carbon",
//   "Manganese",
//   "Silicon",
//   "Sulphur",
//   "Phosphorous",
//   "Chromium",
//   "Nickel",
//   "Molybdenum"
// ];
