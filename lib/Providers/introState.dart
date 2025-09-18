import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class AppStateProvider with ChangeNotifier {
  final GetStorage _storage = GetStorage();
  bool _isFirstLaunch = true;
  // for the first it is luanched and after that when i check it, it is false by the help of the completeOnboarding() function all right that is checked for luanching in here.
  bool get isFirstLaunch => _isFirstLaunch;

  AppStateProvider() {
    _loadAppState();
  }

  void _loadAppState() {
    // Check if onboarding was completed
    _isFirstLaunch = _storage.read('onboarding_completed') != true;
    notifyListeners();
  }

  void completeOnboarding() {
    _isFirstLaunch = false;
    _storage.write('onboarding_completed', true);
    notifyListeners();
  }
}
