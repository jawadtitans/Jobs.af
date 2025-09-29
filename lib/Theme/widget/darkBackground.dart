import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/theme_provider.dart';

class DarkBackground extends StatelessWidget {
  final Widget child;

  const DarkBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isdarkMode;

    if (!isDarkMode) {
      return child; // Light mode: just show page
    }

    return Stack(
      children: [
        // Base dark background color
        Container(color: Colors.black),
        // Top-left corner image
        Positioned(
          top: -30, // adjust as needed
          left: -130, // adjust as needed
          child: Image.asset(
            'assets/images/e.png',
            width: 600, // adjust size as needed
            height: 600,
            fit: BoxFit.cover,
          ),
        ),

        // Bottom-right corner image
        Positioned(
          bottom: -80, // adjust as needed
          right: -150, // adjust as needed
          child: Image.asset(
            fit: BoxFit.cover,
            'assets/images/e.png',
            width: 450, // adjust size as needed
            height: 400,
          ),
        ),

        // Page content
        child,
      ],
    );
  }
}
