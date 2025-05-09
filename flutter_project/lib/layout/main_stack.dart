import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Stack'),
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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Shopping cart icon at the bottom
            Icon(Icons.shopping_cart, size: 50),
            // Positioned CircleAvatar on top-right of the cart icon
            Positioned(
              top: -4,
              right: -4,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
