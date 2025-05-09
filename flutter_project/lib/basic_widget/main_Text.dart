import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Text'),
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
        child: const Column(
          children: [
            Text(
              "Discover the most modern furniture",
              style: TextStyle(
                color: Colors.black, // Black text for visibility
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
