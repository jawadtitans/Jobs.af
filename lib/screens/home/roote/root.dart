import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../Providers/BottomNavigationBars_providers.dart';
import '../../../Providers/theme_provider.dart' as custom;
import '../../../utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunction.isDarkMode(context);

    return Consumer<BottomNavProvider>(
      builder: (context, provider, _) {
        final themeProvider = Provider.of<custom.ThemeProvider>(context);
        return Scaffold(
          extendBody: true,
          // Floating Action Button (centered)
          floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
              ? FloatingActionButton(
                  splashColor: Colors.grey.shade200.withOpacity(0.5),
                  shape: const CircleBorder(),
                  onPressed: () {
                    GoRouter.of(context).push('/search');
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(
                    HugeIcons.strokeRoundedAiSearch,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          // BottomAppBar
          bottomNavigationBar: BottomAppBar(
            height: 75,
            color: themeProvider.isdarkMode ? Color(0xFF0C1826) : Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            padding: EdgeInsets.only(top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Left side icons
                for (int i = 0; i < provider.names.length; i++)
                  if (i < 2) // first 2 items before FAB
                    _NavItem(index: i, provider: provider),

                const SizedBox(width: 60), // Space for FAB notch
                // Right side icons
                for (int i = 2; i < provider.names.length; i++)
                  _NavItem(index: i, provider: provider),
              ],
            ),
          ),

          // Page content
          body: provider.screens[provider.currentIndex],
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final BottomNavProvider provider;

  const _NavItem({super.key, required this.index, required this.provider});

  @override
  Widget build(BuildContext context) {
    final isSelected = provider.currentIndex == index;

    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        onTap: () => provider.changeIndex(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected
                  ? provider.boldIcons[index]
                  : provider.outlineIcons[index],
              color: isSelected ? const Color(0xFF3D464D) : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 1),
            Text(
              provider.names[index], // uses your names list
              style: TextStyle(
                fontFamily: "Arabic",
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w200,
                color: isSelected ? const Color(0xFF3D464D) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
