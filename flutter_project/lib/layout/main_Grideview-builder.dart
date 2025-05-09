import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - GridView'),
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
      body: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10, // Horizontal space between items
            mainAxisSpacing: 10, // Vertical space between items
          ),
          itemCount: 50, // Total number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset.zero,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
