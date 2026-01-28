import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../data/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = true;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      final String response = await rootBundle.loadString(
        'assets/data_json/categoris.json',
      );
      final List data = json.decode(response);
      _categories = data.map((c) => Category.fromJson(c)).toList();
    } catch (e) {
      print("Error loading categories: $e");
      _categories = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
