import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ThemeController with ChangeNotifier {
  bool isDark = false;
  String date = "";
  onModeChanged() {
    isDark = !isDark;
    notifyListeners();
  }

  void dateGetter() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    date = formattedDate;
    notifyListeners();
  }

// Gradient

  int selectedGradient = 0;

  changeGradient() {
    if (selectedGradient == 2) {
      selectedGradient = 0;
    } else {
      selectedGradient++;
    }
    notifyListeners();
  }
}
