import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Expanded'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title, style: const TextStyle(color: Colors.black)),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: const Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "List checklist ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Icon(Icons.check, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
