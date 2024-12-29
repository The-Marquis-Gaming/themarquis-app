import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:marquis_v2/widgets/animated_snackbar.dart';

class SnackbarService with ChangeNotifier {
  SnackbarService._internal();

  static SnackbarService? _instance;

  factory SnackbarService() => _instance ??= SnackbarService._internal();

  final _snackbars = <AnimatedSnackbar>[];

  List<AnimatedSnackbar> get snackbars => _snackbars;

  void displaySnackbar(String message) {
    final time = DateTime.now().toIso8601String().hashCode ^ message.hashCode ^ _snackbars.length;
    final snackbar = AnimatedSnackbar(message: message + snackbars.length.toString(), timeStamp: time.toString(), key: ValueKey(time));
    _snackbars.insert(0, snackbar);
    Timer(const Duration(seconds: 5), () => _removeSnackbar(time.toString()));
    notifyListeners();
  }

  void _removeSnackbar(String timestamp) {
    if (_snackbars.where((element) => element.timeStamp == timestamp).isEmpty) return;
    _snackbars.removeWhere((element) => element.timeStamp == timestamp);
    notifyListeners();
  }

  void removeExistingAndDisplaySnackbar(String message) {
    _snackbars.clear();
    displaySnackbar(message);
  }
}
