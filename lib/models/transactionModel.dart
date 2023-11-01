import 'package:hive/hive.dart';

part 'transactionModel.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String value = "";

  @HiveField(2)
  late String date;

  @HiveField(3)
  late bool isExpense;

  @HiveField(4)
  late int categoryIndex;
}
