import 'package:flutter/material.dart';

import 'curve_appBar.dart';

class Custome_Sliver_appBar extends StatelessWidget {
  final Color color_shape;

  const Custome_Sliver_appBar({super.key, required this.color_shape});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: 150,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {},
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          alignment: Alignment.center,
          children: [
            // Curved container
            ClipPath(
              clipper: CurvedClipper(),
              child: Container(height: 180, color: color_shape),
            ),
            // Logo image
            Positioned(
              bottom: 50,
              left:
                  MediaQuery.of(context).size.width /
                  4, // optional, adjust as needed
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Circular image with 100 radius
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/icons/brands/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // spacing between image and text
                  Padding(
                    padding: EdgeInsets.only(top: 13),
                    child: Text(
                      "Jobs.af",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // adjust color if needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
