import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coding Flutter'),
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

  // Fungsi untuk menangani pilihan di menu titik 3
  void _onMenuOptionSelected(String value) {
    // Menambahkan fungsionalitas untuk setiap pilihan menu jika diperlukan
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 195, 118, 247),
        title: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 20.0,
            ), // Padding lebih besar
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                195,
                118,
                247,
              ), // Latar belakang ungu
              borderRadius: BorderRadius.circular(
                8,
              ), // Radius sudut untuk tampilan lebih smooth
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black, // Warna font hitam
                fontSize: 22, // Ukuran font lebih besar
                fontWeight: FontWeight.bold, // Font tebal
              ),
            ),
          ),
        ),
        actions: [
          // Tombol pencarian
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Tambahkan fungsionalitas pencarian di sini
              print("Pencarian dilakukan");
            },
          ),
          // Tombol titik tiga (menu)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: _onMenuOptionSelected,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Item 1',
                  child: Text('Item 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Item 2',
                  child: Text('Item 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'Item 3',
                  child: Text('Item 3'),
                ),
              ];
            },
          ),
          // Tombol tambah
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Tambahkan fungsionalitas untuk menambah sesuatu
              print("Tombol tambah ditekan");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.blue[100],
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[200]),
                accountName: const Text(
                  'maxxim',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: const Text(
                  "maxxim@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: const CircleAvatar(
                  child: FlutterLogo(size: 50),
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(title: const Text('Item 2'), onTap: () {}),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          // Memindahkan teks ke tengah
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan teks
            children: <Widget>[
              Text(
                'Kamu klik: $_text', // Menampilkan teks berdasarkan pilihan
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center, // Agar teks di tengah
              ),
            ],
          ),
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
