import 'package:wallet/exports.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HiveDB hiveC = Provider.of(context);
    CategorySearcherController categorySearcherC = Provider.of(context);
    DateController dateC = Provider.of(context);
    ThemeController themeC = Provider.of(context);
    IsExpenseController isexpenseC = Provider.of(context);
    return GestureDetector(
      onTap: () => hiveC.addTransaction(context,
          transactionNameController.text,
          amountController.text,
          categorySearcherC.selectedCategoryIndex,
          dateC.dateTime.toString(),
          isexpenseC.isExpense),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Container(
          width: size.width,
          height: size.height / 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: gradients[themeC.selectedGradient]),
          child: Center(
            child: Text("SAVE",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
