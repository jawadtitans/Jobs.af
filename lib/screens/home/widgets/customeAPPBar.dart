import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../Providers/theme_provider.dart' as custom;
import '../../../Theme/theme.dart';
import 'filter/main_content.dart';

class custome_appbar extends StatelessWidget {
  const custome_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<custom.ThemeProvider>(context);
    return SliverAppBar(
      backgroundColor: themeProvider.isdarkMode
          ? Color(0xFF0C1826)
          : Color(0xFFeaf3fe),
      pinned: true,
      floating: false,
      snap: false,
      elevation: 0,
      expandedHeight: 240,
      titleSpacing: 16,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).goNamed('sideMenu'),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                IconlyBold.category,
                color: Colors.grey.shade700,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
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
            backgroundColor: Colors.white.withOpacity(0.9),
          ),
          onPressed: () {
            themeProvider.toggleTheme();
          },
          icon: Icon(
            themeProvider.isdarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        ),
        const SizedBox(width: 15),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/one.jpg"),
        ),
        SizedBox(width: 16),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: const Align(
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
        preferredSize: const Size.fromHeight(60), // <-- set the height you want
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          HugeIcons.strokeRoundedSearch02,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "i.e Web Developers",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.transparent,

                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        useSafeArea: false,
                        enableDrag: false,
                        elevation: 0.0,
                        barrierLabel: "Filter",
                        isDismissible: true,
                        backgroundColor: themeProvider.isdarkMode
                            ? Color(0xFF0C1826)
                            : Colors.white,
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
                                          color: Colors.black54,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
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
                    borderRadius: BorderRadius.circular(14),
                    splashFactory: InkRipple.splashFactory,
                    splashColor: Colors.black87.withOpacity(0.2),
                    highlightColor: Colors.black87.withOpacity(0.00789),
                    child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: const Icon(Iconsax.setting_4, color: Colors.white),
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
