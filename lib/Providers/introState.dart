import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class OnboardingProvider with ChangeNotifier {
  final GetStorage _storage = GetStorage();
  late final PageController pageController = PageController();

  bool _isFirstLaunch = true;
  int _currentPage = 0;
  bool _isGuest = false;
  final int _totalPages = 4;

  /// Getters
  bool get isFirstLaunch => _isFirstLaunch;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get isGuest => _isGuest;

  OnboardingProvider() {
    _loadAppState();
  }

  void _loadAppState() {
    _isFirstLaunch = _storage.read('onboarding_completed') != true;
    _isGuest = _storage.read('is_guest') == true;
    notifyListeners();
  }

  void updatePage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void continueAsGuest(BuildContext context) {
    _isGuest = true;
    _isFirstLaunch = false;
    _storage.write('onboarding_completed', true);
    _storage.write('is_guest', true);
    notifyListeners();

    // Navigate directly to home page
    GoRouter.of(context).go('/home');
  }

  void logoutGuest() {
    _isGuest = false;
    _storage.write('is_guest', false);
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (_currentPage < _totalPages - 1) {
      pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding(context);
    }
  }

  void skipOnboarding(BuildContext context) {
    completeOnboarding(context);
  }

  void completeOnboarding(BuildContext context) {
    _isFirstLaunch = false;
    _storage.write('onboarding_completed', true);
    notifyListeners();
    // Navigate to login
    GoRouter.of(context).go('/login');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
