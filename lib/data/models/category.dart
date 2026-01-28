import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

/// Service model
class Service {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;

  Service({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
  });

  /// Maps a service type or title to the correct IconData
  static IconData _getIcon(String type) {
    switch (type.toLowerCase()) {
      // Development
      case 'mobile':
        return HugeIcons.strokeRoundedMobileProgramming02;
      case 'web':
        return HugeIcons.strokeRoundedWebDesign01;
      case 'game':
        return HugeIcons.strokeRoundedGame;
      case 'database':
        return HugeIcons.strokeRoundedDatabase;
      case 'testing':
        return HugeIcons.strokeRoundedTestTube;
      case 'ai':
        return HugeIcons.strokeRoundedAiSearch;

      // Business
      case 'finance':
        return HugeIcons.strokeRoundedMoney01;
      case 'entrepreneurship':
        return HugeIcons.strokeRoundedCreativeMarket;
      case 'marketing':
        return HugeIcons.strokeRoundedMarketing;

      // Design
      case 'uiux':
        return HugeIcons.strokeRoundedWebDesign02;
      case 'graphic':
        return HugeIcons.strokeRoundedUserIdVerification;

      // IT & Networking
      case 'sysadmin':
        return HugeIcons.strokeRoundedManager;
      case 'network':
        return HugeIcons.strokeRoundedNeuralNetwork;

      // Healthcare
      case 'nursing':
        return HugeIcons.strokeRoundedHealth;
      case 'medical_research':
        return HugeIcons.strokeRoundedMicroscope;

      // Education
      case 'teaching':
        return HugeIcons.strokeRoundedTeacher;
      case 'elearning':
        return HugeIcons.strokeRoundedElearningExchange;

      // Sales
      case 'sales_exec':
        return HugeIcons.strokeRoundedGrapes;
      case 'account_mgmt':
        return HugeIcons.strokeRoundedAccountSetting01;

      // Media & Communication
      case 'content':
        return HugeIcons.strokeRoundedContentWriting;
      case 'journalism':
        return HugeIcons.strokeRoundedNews;

      // Legal
      case 'lawyer':
        return HugeIcons.strokeRoundedLabelImportant;
      case 'paralegal':
        return HugeIcons.strokeRoundedPackage;

      // Creative Arts
      case 'photography':
        return HugeIcons.strokeRoundedCamera01;
      case 'video':
        return HugeIcons.strokeRoundedVideo01;

      default:
        return Icons.help_outline; // fallback icon
    }
  }

  factory Service.fromJson(Map<String, dynamic> json) {
    // Convert color hex strings to Flutter Color
    final colorList = (json['colors'] as List<dynamic>).map((c) {
      final hex = c.toString().replaceFirst('#', '0xFF');
      return Color(int.parse(hex));
    }).toList();

    return Service(
      title: json['title'],
      subtitle: json['subtitle'],
      icon: _getIcon(json['type'] ?? json['title']), // map icon
      colors: colorList,
    );
  }
}

/// Category model
class Category {
  final String title;
  final List<Service> services;

  Category({required this.title, required this.services});

  factory Category.fromJson(Map<String, dynamic> json) {
    final services = (json['services'] as List)
        .map((s) => Service.fromJson(s))
        .toList();

    return Category(title: json['title'], services: services);
  }
}
