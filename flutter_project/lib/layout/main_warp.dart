import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyWrap());
  }
}

class MyWrap extends StatelessWidget {
  MyWrap({super.key});

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coding Flutter - Wrap")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Wrap(
              spacing: 20, // Horizontal space between items
              runSpacing: 10, // Vertical space between rows
              children:
                  colors.map((color) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.grey),
                          color: color,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: Offset.zero,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
