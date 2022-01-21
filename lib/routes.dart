import 'package:flutter/material.dart';
import 'package:kobe_thesis/main.dart';
import 'package:kobe_thesis/settings.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    '/': (context) => const Main(),
    '/settings': (context) => const SettingsScreen(),
  };
}
