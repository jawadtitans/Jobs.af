import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onTap;
  final Color Border_color, TextColors;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
    required this.Border_color,
    required this.TextColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Border_color, width: 1.3),
      ),
      child: Material(
        color: Colors.white, // background color of the button
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          splashFactory: InkRipple.splashFactory,
          splashColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                if (icon != null) const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: TextColors,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
