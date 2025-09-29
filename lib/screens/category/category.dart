import 'package:flutter/material.dart';

import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:iconly/iconly.dart';

import 'package:provider/provider.dart';

import '../../Providers/theme_provider.dart' as custom;
import '../../utils/constants/colors.dart';

class category_page extends StatelessWidget {
  const category_page({super.key});

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

      /// Main body
      body: ListView(
        padding: const EdgeInsets.all(17),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: ExpandedTile(
              theme: ExpandedTileThemeData(
                headerColor: themeProvider.isdarkMode
                    ? const Color(0xFF0C1826)
                    : Colors.white,
                headerPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                headerBorder: OutlineInputBorder(
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
                trailingPadding: EdgeInsets.zero, // remove extra spacing
              ),
              controller: ExpandedTileController(isExpanded: false),
              title: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // push text to right
                children: [
                  Container(
                    width: 5,
                    height: 25,
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(width: 6),

                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 5),
                    child: Text(
                      "Development",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: "Arabic",
                        fontSize: 16,
                        color: themeProvider.isdarkMode
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              /// Let ExpandedTile handle the arrow automatically (on the LEFT side)
              trailing: const Icon(
                HugeIcons.strokeRoundedArrowRight01,
                size: 22,
              ),

              content: Column(
                children: [
                  buildServiceTile(
                    context,
                    "استیکینگ تتر",
                    "با استیک دارایی ارزی خود پاداش کسب کنید",
                    HugeIcons.strokeRoundedMobileProgramming02,
                    [Color(0xFF50c878), Color(0xFF3eb489)],
                  ),
                  buildServiceTile(
                    context,
                    "خرید گیفت کارت",
                    "خرید انواع گیفت کارت با تحویل فوری",
                    HugeIcons.strokeRoundedLaptop,
                    [Color(0xFF003366), Color(0xFF003366)],
                  ),
                  buildServiceTile(
                    context,
                    "سواپ ارز دیجیتال",
                    "سواپ ارزدیجیتال در کیف پول من",
                    HugeIcons.strokeRoundedAdobePhotoshop,
                    [Color(0xFF2C74E6), Color(0xFF75A4EF)],
                  ),
                  buildServiceTile(
                    context,
                    "معامله سریع",
                    "خرید و فروش سریع ارز",
                    HugeIcons.strokeRoundedWrench01,
                    [Color(0xFF1e90ff), Color(0xFF99badd)],
                  ),
                  buildServiceTile(
                    context,
                    "معاملات حرفه‌ای",
                    "در معاملات حرفه‌ای با حداقل کارمزد 0.2% معامله کنید.",
                    HugeIcons.strokeRoundedSchool,
                    [Color(0xFFEEB68C), Color(0xFFE27D4E)],
                  ),
                  buildServiceTile(
                    context,
                    "تبدیل دارایی های خرد",
                    "می‌توانید دارایی‌های ارزی کم ارزش خود را به تومان تبدیل کنید",
                    HugeIcons.strokeRoundedHealtcare,
                    [Color(0xFF228b22), Color(0xFF32cd32)],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          /// Expandable section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ExpandedTile(
              theme: ExpandedTileThemeData(
                headerColor: themeProvider.isdarkMode
                    ? const Color(0xFF0C1826)
                    : Colors.white,
                headerPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                headerBorder: OutlineInputBorder(
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
                headerSplashColor: Colors.transparent,
                trailingPadding: EdgeInsets.zero, // remove extra spacing
              ),
              controller: ExpandedTileController(isExpanded: false),
              title: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // push text to right
                children: [
                  Container(
                    width: 5,
                    height: 25,
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(width: 6),

                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 5),
                    child: Text(
                      "Business",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: "Arabic",
                        fontSize: 16,
                        color: themeProvider.isdarkMode
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              /// Let ExpandedTile handle the arrow automatically (on the LEFT side)
              trailing: const Icon(
                HugeIcons.strokeRoundedArrowRight01,
                size: 22,
              ),

              content: Column(
                children: [
                  buildServiceTile(
                    context,
                    "Finance",
                    "all the related Jobs in Finance",
                    HugeIcons.strokeRoundedHelpCircle,
                    [Color(0xFF1e90ff), Color(0xFF99badd)],
                  ),
                  buildServiceTile(
                    context,
                    "Entrepreneurship",
                    "complete Jobs in Entrepreneurship",
                    HugeIcons.strokeRoundedLanguageSkill,
                    [Color(0xFFb0e0e6), Color(0xFF4682b4)],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServiceTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    List<Color> colors,
  ) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        elevation: 0.0,
        color: Provider.of<custom.ThemeProvider>(context).isdarkMode
            ? const Color(0xFF0C1826)
            : Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: ListTile(
          onTap: () {},
          splashColor: Colors.grey.shade900,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),

          leading: Icon(HugeIcons.strokeRoundedArrowRight01, size: 20),

          title: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Arabic",
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontFamily: "Estedad",
              fontSize: 11,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.left,
          ),

          /// 👇 Now `trailing` goes to the LEFT
          trailing: Container(
            padding: const EdgeInsets.all(8),
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              gradient: LinearGradient(
                end: Alignment.bottomLeft,
                begin: Alignment.topRight,
                colors: colors,
              ),
            ),
            child: Icon(icon, size: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
