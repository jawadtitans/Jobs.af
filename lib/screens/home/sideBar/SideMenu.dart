import 'package:flutter/material.dart';

import '../../../Theme/theme.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: AppTheme.lightTheme.scaffoldBackgroundColor,
        width: 288,
        child: SafeArea(
          child: Column(
            children: [
              // first header part in here:
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset(
                    "assets/images/one.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  "Eng. Jawad Rahimi",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
