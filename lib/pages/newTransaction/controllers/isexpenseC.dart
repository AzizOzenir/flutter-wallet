import 'package:flutter/material.dart';

class IsExpenseController with ChangeNotifier {
  bool isExpense = true;

  onChange() {
    isExpense = !isExpense;
    notifyListeners();
  }
}
