// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:enhanced_drop_down/enhanced_drop_down.dart';
// import './selectOption.dart';

// void main() {
//   return runApp(ChartApp());
// }

// class ChartApp extends StatelessWidget {
//   // ChartApp({Key key, @required this.text}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chart Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: PlotScreen(),
//     );
//   }
// }

// class PlotScreen extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   PlotScreen();

//   @override
//   _PlotScreenState createState() => _PlotScreenState();
// }

// class _PlotScreenState extends State<PlotScreen> {
//   List<MachData> chartData = [];

//   Future loadMachData() async {
//     final String jsonString = await getJsonFromAssets();
//     // String jsonString = await rootBundle.loadString('assets/data.json');
//     final dynamic jsonResponse = json.decode(jsonString);
//     setState(() {
//       for (Map<String, dynamic> i in jsonResponse) {
//         chartData.add(MachData.fromJson(i));
//       }
//     });
//   }

//   Future<String> getJsonFromAssets() async {
//     return await rootBundle.loadString('assets/data.json');
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadMachData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Smart Foundry'),
//       ),
//       body: Center(
//           child: FutureBuilder(
//               future: getJsonFromAssets(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return SfCartesianChart(
//                       primaryXAxis: CategoryAxis(),
//                       // Chart title
//                       title: ChartTitle(text: 'Machine Data'),
//                       series: <ChartSeries<MachData, String>>[
//                         LineSeries<MachData, String>(
//                           dataSource: chartData,
//                           xValueMapper: (MachData machData, _) => machData.id,
//                           yValueMapper: (MachData machData, _) => machData.attr,
//                         )
//                       ]);
//                 } else {
//                   return Card(
//                     elevation: 5.0,
//                     child: Container(
//                       height: 100,
//                       width: 400,
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text('Retriving JSON data...',
//                                 style: TextStyle(fontSize: 20.0)),
//                             Container(
//                               height: 40,
//                               width: 40,
//                               child: CircularProgressIndicator(
//                                 semanticsLabel: 'Retriving JSON data',
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                     Colors.blueAccent),
//                                 backgroundColor: Colors.grey[300],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//               })),
//     );
//   }
// }

// class MachData {
//   MachData(this.id, this.attr);

//   final String id;
//   final double attr;

//   factory MachData.fromJson(Map<String, dynamic> parsedJson) {
//     return MachData(
//       parsedJson['ID'],
//       double.parse(parsedJson['Metal_Preparation_minutes']),
//     );
//   }
// }
