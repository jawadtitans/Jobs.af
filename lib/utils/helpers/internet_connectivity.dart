import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

/// Provider class to manage network connectivity status
class NetworkProvider with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;

  ConnectivityResult get connectionStatus => _connectionStatus;

  NetworkProvider() {
    _initConnectivity();
  }

  void _initConnectivity() async {
    // Listen for connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      results,
    ) {
      if (results.isNotEmpty) {
        _updateConnectionStatus(results.first);
      }
    });

    // Check initial connectivity
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results as ConnectivityResult);
    } on PlatformException catch (_) {
      _updateConnectionStatus(ConnectivityResult.none);
    }
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    _connectionStatus = result;
    notifyListeners();

    if (_connectionStatus == ConnectivityResult.none) {
      print("The internet is not connected, please try again");
    }
  }

  Future<bool> isConnected() async {
    try {
      final results = await _connectivity.checkConnectivity();
      return results != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  void disposeProvider() {
    _connectivitySubscription.cancel();
  }
}
