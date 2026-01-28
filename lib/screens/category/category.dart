import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../Providers/categoryProvider.dart';
import '../../Providers/theme_provider.dart' as custom;
import '../../utils/constants/colors.dart';
import 'widgets/expandedTile.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isdarkMode
            ? const Color(0xFF000C19)
            : Colors.white,
        elevation: 0,
        titleSpacing: 12,
        title: SearchBar(
          constraints: const BoxConstraints(maxHeight: 80, minHeight: 47),
          leading: Icon(IconlyLight.search, color: Colors.grey.shade400),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
          elevation: WidgetStateProperty.all(0.0),
          hintText: "i.e Mobile Developer",
          hintStyle: WidgetStateProperty.all(
            TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            themeProvider.isdarkMode
                ? const Color(0xFF0C1826)
                : Colors.white.withOpacity(0.9),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide.none,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                IconlyLight.filter,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(17),
            children: provider.categories
                .map(
                  (cat) => CategoryTile(
                    category: cat,
                    isDarkMode: themeProvider.isdarkMode,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
