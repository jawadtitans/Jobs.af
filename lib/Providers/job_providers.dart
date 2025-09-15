import 'package:flutter/foundation.dart';

class JobProvider with ChangeNotifier {
  String _selectedJob = "";

  String get selectedJob => _selectedJob;

  void selectJob(String job) {
    _selectedJob = job;
    notifyListeners(); // Notify all listening widgets
  }
}
