import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallet/exports.dart';

class HiveDB extends HiveObject with ChangeNotifier {
  int incomes = 0;
  int expenses = 0;

  List<TransactionModel> allTransactions = [];

  Future<void> addTransaction(BuildContext context,String name, String value, int categoryIndex, String date,
      bool isExpense) async {
    TransactionModel newModel = TransactionModel()
      ..categoryIndex = categoryIndex
      ..date = date
      ..isExpense = isExpense
      ..name = name
      ..value = value;
    Fluttertoast.showToast(
        msg: "Your Transaction succesfully saved", gravity: ToastGravity.TOP);
    Box<TransactionModel> box =await Hive.box<TransactionModel>("transactions");
    box.add(newModel);
    notifyListeners();
    fetchTransactions();

    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
  }

  Future<void> updateTransaction(int where, String name, String value,
      int categoryIndex, String date, bool isExpense) async {
    TransactionModel updatedModel = TransactionModel()
      ..categoryIndex = categoryIndex
      ..date = date
      ..isExpense = isExpense
      ..name = name
      ..value = value;
    notifyListeners();

    Box<TransactionModel> box =await Hive.box<TransactionModel>("transactions");
    box.putAt(where, updatedModel);
  }

  deleteTransaction(int where) async {
    final box = await Hive.openBox<TransactionModel>("transactions");
    box.deleteAt(where);
    allTransactions = [];
    fetchTransactions();
    notifyListeners();
  }

  void fetchTransactions() async {
    Box<TransactionModel> box =
        await Hive.openBox<TransactionModel>("transactions");
    allTransactions = [];
    allTransactions = box.values.toList();
    expenses = 0;
    incomes = 0;
    for (var element in allTransactions) {
      if (amountController != null) {
        if (element.isExpense) {
         
          expenses += int.parse(element.value ?? "0");
        } else {
          incomes += int.parse(element.value);
        }
      } else {}
    }
    notifyListeners();
  }
}
