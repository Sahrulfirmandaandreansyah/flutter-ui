import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - DropdownButton'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ), // Set seedColor to white
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selected = "Dart";

  final List<String> dropDownList = const [
    "Dart",
    "Kotlin",
    "Java",
    "Javascript",
    "PHP",
    "Python",
    "Ruby",
    "Swift",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background color to white
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ), // Set title text color to black
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white, // Set Container background color to white
        child: Column(
          children: [
            // Replacing TextField with DropdownButton
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Bahasa favorit: "),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selected,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 20,
                  style: TextStyle(color: Colors.blue[600]),
                  underline: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 3),
                      ),
                    ),
                  ),
                  items:
                      dropDownList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged: (val) {
                    setState(() {
                      if (val != null) selected = val;
                      print(selected); // Print selected value for testing
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
