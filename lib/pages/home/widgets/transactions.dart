import 'package:wallet/exports.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    HiveDB hiveC = Provider.of(context);
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: List.generate(
          hiveC.allTransactions.length, (index) => Transaction(index: index)),
    );
  }
}
