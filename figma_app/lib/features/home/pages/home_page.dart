import 'package:flutter/material.dart';
import '../../home/widgets/app_bar_home.dart';
import '../../home/widgets/category_home.dart';
import '../../home/widgets/recommended_furniture_home.dart';
import '../../home/widgets/bottom_navigation_bar_home.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(), // Menggunakan AppBarHome yang telah didefinisikan
      backgroundColor: const Color(0xFFF2F2F2), // Warna latar belakang halaman
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0), // Padding horizontal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri
          children: [
            const SizedBox(height: 20), // Jarak atas
            SizedBox(
              width: 226, // Lebar teks
              child: Text(
                'Discover the most modern furniture',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xFF4A4543)),
                ),
              ),
            ),
            const SizedBox(height: 30), // Jarak atas
            const SizedBox(
              height: 40, // Tinggi untuk CategoryHome
              child: CategoryHome(), // Widget kategori
            ),
            Text(
              "Recommended Furnitures",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xFF4A4543),
              )),
            ),
            const SizedBox(height: 20), // Jarak antara kategori dan furnitur
            Expanded(
              child: RecommendedFurnituresHome(), // Widget furnitur yang direkomendasikan
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbarHome(), // Menggunakan BottomNavbarHome
    );
  }
}
