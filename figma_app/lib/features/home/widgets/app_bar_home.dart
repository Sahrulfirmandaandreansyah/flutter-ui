import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      ),
      title: Center(
          child: Text(
        "Home",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff4A4543)),
        ),
      )),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/search.svg'),
        ),
      ],
    );
  }

  // Implement the preferredSize getter for PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Height of the AppBar
}
