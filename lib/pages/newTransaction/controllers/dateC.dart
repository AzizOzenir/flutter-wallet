import 'package:flutter/material.dart';

class DateController extends ChangeNotifier {
  DateTime dateTime = DateTime.now();
  DateTime today = DateTime.now();
  bool isChanged = false;

  onChanged(DateTime v) {
    dateTime = v;
    isChanged == false ? isChanged = true : null;
    notifyListeners();
  }
}
