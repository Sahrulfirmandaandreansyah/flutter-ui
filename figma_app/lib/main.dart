import 'package:flutter/material.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/detail/pages/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      //home: DetailPage(),
      routes: {
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
