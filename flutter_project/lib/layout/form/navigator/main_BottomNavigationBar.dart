import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter - Bottom Navigation'),
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
  // Data untuk menu items pada bottom navigation
  List<Map<String, dynamic>> menuItems = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Chart", "icon": Icons.shopping_cart},
    {"title": "Favorites", "icon": Icons.star_border},
    {"title": "Account", "icon": Icons.person},
  ];

  int _selectedItem = 0; // Menyimpan indeks item yang dipilih
  String _text = "Home"; // Menyimpan teks untuk ditampilkan

  // Fungsi untuk menangani perubahan pilihan pada bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index; // Perbarui item yang dipilih
      _text = menuItems[index]["title"]; // Perbarui teks yang ditampilkan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kamu klik: $_text', // Menampilkan teks berdasarkan pilihan
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels:
            false, // Tidak menampilkan label yang tidak dipilih
        showSelectedLabels: false, // Tidak menampilkan label yang dipilih
        unselectedItemColor: Colors.black87,
        elevation: 32,
        type:
            BottomNavigationBarType.fixed, // Menampilkan item dalam bentuk grid
        selectedLabelStyle: const TextStyle(height: 1.5, fontSize: 12),
        unselectedLabelStyle: const TextStyle(height: 1.5, fontSize: 12),
        items:
            menuItems
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item["icon"]), // Ikon untuk setiap item
                    label: item["title"], // Label untuk setiap item
                    activeIcon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Icon(
                        item["icon"],
                      ), // Ikon aktif dengan tampilan berbeda
                    ),
                  ),
                )
                .toList(),
        currentIndex: _selectedItem, // Menyimpan indeks item yang dipilih
        selectedItemColor: Colors.blue, // Warna item yang dipilih
        onTap: _onItemTapped, // Fungsi untuk menangani tap
      ),
    );
  }
}
