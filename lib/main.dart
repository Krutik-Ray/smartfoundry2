import 'dart:async';

import 'package:flutter/material.dart';
import 'package:enhanced_drop_down/enhanced_drop_down.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  // ChartApp({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstScreen(),
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter',
//     home: FirstScreen(),
//   ));
// }

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  // this allows us to access the TextField text
  String _selected = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select the parameter'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: new EnhancedDropDown.withData(
                  dropdownLabelTitle: "Label",
                  defaultOptionText: "Select the parameter",
                  dataSource: parameters,
                  valueReturned: (chosen) {
                    _selected = jsonEncode(chosen);
                    print(_selected);
                  },
                ),
              ),
              RaisedButton(
                child: Text(
                  'Go to Plot Screen',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  _sendDataToSecondScreen(context);
                },
              )
            ]));
  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlotScreen(
            text: _selected,
          ),
        ));
  }
}

class PlotScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  final String text;
  PlotScreen({Key key, @required this.text}) : super(key: key);
  getText() {
    return text;
  }

  @override
  _PlotScreenState createState() => _PlotScreenState();
}

class _PlotScreenState extends State<PlotScreen> {
  // receive data from the FirstScreen as a parameter
  String option;
  List<MachData> chartData = [];
  List chartKeys = [];

  Future loadMachData() async {
    final String jsonString = await getJsonFromAssets();
    // String jsonString = await rootBundle.loadString('assets/data.json');
    final dynamic jsonResponse = json.decode(jsonString);
    setState(() {
      for (Map<String, dynamic> i in jsonResponse) {
        chartData.add(MachData.fromJson(i));
      }
    });
  }

  Future<String> getJsonFromAssets() async {
    return await rootBundle.loadString('assets/data.json');
  }

  @override
  void initState() {
    option = widget.text;
    print(option);
    super.initState();
    loadMachData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Foundry'),
      ),
      body: Center(
          child: FutureBuilder(
              future: getJsonFromAssets(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: option),
                      series: <ChartSeries<MachData, String>>[
                        LineSeries<MachData, String>(
                          dataSource: chartData,
                          xValueMapper: (MachData machData, _) => machData.id,
                          yValueMapper: (MachData machData, _) => machData.attr,
                        )
                      ]);
                } else {
                  return Card(
                    elevation: 5.0,
                    child: Container(
                      height: 100,
                      width: 400,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Retriving JSON data...',
                                style: TextStyle(fontSize: 20.0)),
                            Container(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                semanticsLabel: 'Retriving JSON data',
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.blueAccent),
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              })),
    );
  }
}

class MachData extends _PlotScreenState {
  static String param;
  final String id;
  final double attr;
  // MachData(_PlotScreenState) {
  //   param = text;
  // }
  MachData(this.id, this.attr) {
    param = jsonEncode(option);
  }
  factory MachData.fromJson(Map<String, dynamic> parsedJson) {
    return MachData(
      parsedJson['ID'],
      double.parse(parsedJson['Metal_Preparation_minutes']),
    );
  }
}
// class SecondScreen extends StatelessWidget {
//   final String text;

//   // receive data from the FirstScreen as a parameter
//   SecondScreen({Key key, @required this.text}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second screen')),
//       body: Center(
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
List<String> parameters = [
  "FLASH",
  "MISRUN",
  "CERAMIC_INCLUSION",
  "SHRINKAGE",
  "SLAG_INCLUSION",
  "Metal_Preparation_minutes",
  "Tapping_Temperature_C",
  "Time_Taken_for_Injection_sec",
  "Press_Room_Temperature_C",
  "Press_Room_Humidity",
  "Process_Duration_days",
  "Shell_Weight_before_Dewaxing_kg",
  "Shell_Weight_after_Dewaxing_kg",
  "Viscosity_Primary_Slurry_sec",
  "pH_Primary_Slurry",
  "Temperature_of_Primary_Coating_Room_C",
  "Humidity_of_Primary_Coating_Room",
  "Viscosity_Secondary_Slurry_sec",
  "pH_Secondary_Slurry",
  "Temperature_of_Secondary_Coating_Room_C",
  "Humidity_of_Secondary_Coating_Room",
  "Nickel_extra",
  "Carbon",
  "Manganese",
  "Silicon",
  "Sulphur",
  "Phosphorous",
  "Chromium",
  "Nickel",
  "Molybdenum"
];
