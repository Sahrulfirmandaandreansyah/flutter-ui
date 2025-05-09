import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarDetail extends StatefulWidget {
  const AppBarDetail({super.key});

  @override
  State<AppBarDetail> createState() => _AppBarDetailState();
}

class _AppBarDetailState extends State<AppBarDetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/back.svg"),
        ),
        Text("Detail",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4A4543),
            )),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  "assets/icons/love.svg",
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/share.svg"),
            ),
          ],
        ),
      ],
    );
  }
}