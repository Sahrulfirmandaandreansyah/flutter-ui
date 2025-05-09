import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // No 'const' here since 'MyHomePage' is not const
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: 'Coding Flutter - ListView',
      ), // Removed 'const' here
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ), // Set seedColor to white
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Removed 'const' here
  MyHomePage({super.key, required this.title}); // Removed 'const'

  final String title;

  final List<String> categories = [
    "All",
    "Living Room",
    "Bedroom",
    "Dining Room",
    "Kitchen",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background color to white
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ), // Set title text color to black
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 35,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 200,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.vertical,
            ),
          ),
          SizedBox(
            height: 200,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  CustomListView({
    super.key,
    required this.categories,
    required this.scrollDirection,
  });

  final List<String> categories;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      children: List.generate(categories.length, (index) {
        return GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Text(
              categories[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
        );
      }),
    );
  }
}
