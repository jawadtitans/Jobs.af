import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../screens/category/category.dart';
import '../screens/home/home_page.dart';

// Provider
class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> get screens => [
    const JobHomePage(key: ValueKey('home_screen')),
    const category_page(key: ValueKey('category_screen')),
    const Center(
      key: ValueKey('notify_screen'),
      child: Text("notify Screen", style: TextStyle(fontSize: 18)),
    ),
    const Center(
      key: ValueKey('profile_screen'),
      child: Text("Profile Screen", style: TextStyle(fontSize: 18)),
    ),
  ];

  // Names of tabs
  final List<String> names = ['خانه', 'دسته بندی ها', 'اعلان ها', 'شغل من'];

  // Icons using Iconly
  final List<IconData> outlineIcons = [
    IconlyLight.home,
    IconlyLight.category,
    IconlyLight.notification,
    IconlyLight.profile,
  ];

  final List<IconData> boldIcons = [
    IconlyBold.home,
    IconlyBold.category,
    IconlyBold.notification,
    IconlyBold.profile,
  ];
}
