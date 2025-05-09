import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Coding Flutter - SliverAppBar',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "UNISNU Jepara",
                style: TextStyle(color: Colors.black),
              ),
              background: FlutterLogo(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.blue[200],
                  height: 100,
                  child: Center(
                    child: Text("Item $index", style: TextStyle(fontSize: 18)),
                  ),
                );
              },
              childCount: 20, // Menampilkan 20 item
            ),
          ),
        ],
      ),
    );
  }
}
