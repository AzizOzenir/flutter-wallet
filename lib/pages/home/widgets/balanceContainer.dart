import 'package:wallet/exports.dart';
import 'package:intl/intl.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HiveDB dbC = Provider.of(context);
    ThemeController themeC = Provider.of(context);
    return GestureDetector(
      onTap: () {
        /*  Navigator.push(
            context, MaterialPageRoute(builder: (context) => StatisticsPage())); */
      },
      child: Container(
        height: size.height / 3,
        width: size.width - 50,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: bRadiusSoft,
            gradient: gradients[themeC.selectedGradient]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "€  ${dbC.incomes - dbC.expenses}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ExpenseIncomePlace(isIncome: true, value: dbC.incomes),
                ExpenseIncomePlace(isIncome: false, value: dbC.expenses)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ExpenseIncomePlace extends StatelessWidget {
  bool isIncome;
  int value;

  ExpenseIncomePlace({
    required this.isIncome,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat("###,###,###,000");
    String newvalue = numberFormat.format(value);
    return Container(
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.withOpacity(0.5)),
            child: Center(
              child: Icon(isIncome ? Iconsax.arrow_up : Iconsax.arrow_bottom,
                  color: isIncome ? Colors.green : Colors.red, size: 26),
            ),
          ),
          Column(
            children: [
              Text(
                isIncome ? "Incomes" : "Expenses",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
              ),
              Text(
                newvalue,
                style: const TextStyle(fontSize: 22, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
