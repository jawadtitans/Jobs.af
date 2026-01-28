import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../Providers/theme_provider.dart' as custom;
import '../../../utils/constants/colors.dart';
import 'filter/main_content.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);

    return SliverAppBar(
      backgroundColor: themeProvider.isdarkMode
          ? const Color(0xFF000C19)
          : const Color(0xFFeaf3fe),
      pinned: true,
      floating: false,
      snap: false,
      elevation: 0,
      expandedHeight: 240,
      titleSpacing: 16,
      title: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              backgroundColor: themeProvider.isdarkMode
                  ? Color(0xFF0C1826)
                  : Colors.white,
            ),
            onPressed: () {},
            icon: Icon(
              size: 20,
              IconlyBold.category,
              color: themeProvider.isdarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            "Home",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      actions: [
        IconButton(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(7),
            backgroundColor: themeProvider.isdarkMode
                ? Colors.black38
                : Colors.white.withOpacity(0.7),
          ),
          onPressed: () {
            themeProvider.toggleTheme();
          },
          icon: Icon(
            themeProvider.isdarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        ),
        const SizedBox(width: 15),
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/one.jpg"),
        ),
        const SizedBox(width: 16),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0),
              child: Text(
                "Discover your\ndream job",
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).push('/search');
                  },
                  child: Container(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    height: 47,
                    decoration: BoxDecoration(
                      color: themeProvider.isdarkMode
                          ? Color(0xFF0C1826)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(IconlyLight.search, size: 22, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          "i.e Mobile Developer",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const FilterBottomSheet(),
                  );
                },
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.black38,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      showModalBottomSheet(
                        useSafeArea: false,
                        enableDrag: false,
                        elevation: 0.0,
                        barrierLabel: "Filter",
                        isDismissible: true,
                        backgroundColor: themeProvider.isdarkMode
                            ? Color(0xFF000C19)
                            : const Color(0xFFf1f1f1),
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        builder: (context) => DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.84,
                          minChildSize: 0.1,
                          maxChildSize: 0.93,
                          builder: (context, scrollController) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 21,
                                vertical: 13,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  /// TODO: header part in here:
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.close, size: 24),
                                      ),
                                      Text(
                                        "Filter",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: themeProvider.isdarkMode
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),

                                  /// TODO: main contents
                                  FilterContents(),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: TColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        IconlyLight.filter,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
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

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Text(
          'Filter options will be implemented here',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
