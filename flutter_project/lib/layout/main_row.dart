import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Row'),
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
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
            const Text(
              "Detail",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
            ),
            IconButton(
              icon: const Icon(Icons.share, size: 32),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
