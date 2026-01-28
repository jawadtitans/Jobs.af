import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../../Providers/theme_provider.dart' as custom;
import '../../../data/models/category.dart';
import '../../../utils/constants/colors.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final bool isDarkMode;

  const CategoryTile({
    super.key,
    required this.category,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    final ExpandedTileController controller = ExpandedTileController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          20,
        ), // make image respect rounded corners
        child: ExpandedTile(
          expansionDuration: const Duration(milliseconds: 300),
          expansionAnimationCurve: Curves.easeInOutCubic,
          theme: ExpandedTileThemeData(
            headerColor: themeProvider.isdarkMode
                ? Color(0xFF0C1826)
                : Colors.white, // make header transparent so image shows
            headerPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),

            headerBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            contentSeparatorColor: Colors.transparent,
            contentBackgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.only(
              top: 8,
              right: 6,
              left: 6,
              bottom: 10,
            ),
            headerSplashColor: Colors.white.withOpacity(0.2),
            trailingPadding: EdgeInsets.zero,
          ),
          controller: ExpandedTileController(isExpanded: false),
          title: Row(
            children: [
              Container(
                width: 4,
                height: 23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: TColors.primary,
                ),
              ),
              const SizedBox(width: 9),
              Text(
                category.title,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: themeProvider.isdarkMode
                      ? Colors.white
                      : Colors.black, // make text visible over image
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          trailing: AnimatedRotation(
            duration: const Duration(milliseconds: 4500),
            curve: Curves.easeInOut,
            turns: 0.0,
            child: Icon(
              HugeIcons.strokeRoundedArrowRight01,
              size: 22,
              color: themeProvider.isdarkMode ? Colors.white : Colors.black,
            ),
          ),
          content: Column(
            children: category.services.map((service) {
              return Card(
                shadowColor: Colors.transparent,
                elevation: 0.0,
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: themeProvider.isdarkMode
                    ? Color(0xFF0C1826)
                    : Colors.white, // semi-transparent so image shows through
                child: ListTile(
                  splashColor: Colors.white.withOpacity(0.3),
                  onTap: () {},
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: service.colors,
                      ),
                    ),
                    child: Icon(service.icon, color: Colors.white, size: 30),
                  ),
                  title: Text(
                    service.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Arabic",
                      fontWeight: FontWeight.w600,
                      color: themeProvider.isdarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    service.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "Estedad",
                      fontWeight: FontWeight.w300,
                      color: themeProvider.isdarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  trailing: Icon(
                    HugeIcons.strokeRoundedArrowRight01,
                    size: 23,
                    color: themeProvider.isdarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
