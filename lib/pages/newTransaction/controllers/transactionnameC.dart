import 'package:flutter/material.dart';

class TransactionNameController with ChangeNotifier {
  String transactionName = "";

  onChangedName(String name) {
    transactionName = name;
    notifyListeners();
  }
}
