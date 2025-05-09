import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  const PageWidget({required this.child, this.bottomNavigationBar, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: child),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
