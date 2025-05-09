import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Icon'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
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
      backgroundColor:
          Colors.white, // Set the background color of the scaffold to white
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          142,
          204,
          255,
        ), // Set AppBar background color to blue
        title: Row(
          children: const [
            Icon(
              Icons.home, // Home icon
              color: Colors.black,
              size: 32, // Set size for home icon
            ),
            SizedBox(width: 20), // Adds space between the two icons
            Icon(
              Icons.favorite, // Favorite icon
              color: Colors.red,
              size: 36, // Set size for favorite icon
            ),
          ],
        ),
      ),
    );
  }
}
