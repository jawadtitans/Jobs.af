import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/theme_provider.dart' as custom;

class SectionLabel extends StatelessWidget {
  final String title;
  const SectionLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: themeProvider.isdarkMode
              ? Colors.grey.shade400
              : Colors.grey.shade800,
        ),
      ),
    );
  }
}
