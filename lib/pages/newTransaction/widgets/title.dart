import 'package:wallet/exports.dart';

class xTitle extends StatelessWidget {
  const xTitle({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    IsExpenseController isExpenseController = Provider.of(context);
    return Center(
      child: SizedBox(
        width: size.width - 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Text("Add"),
                Text(
                  isExpenseController.isExpense ? " Expense" : " Income",
                  style: TextStyle(
                      color: isExpenseController.isExpense
                          ? Colors.red
                          : Colors.green),
                ),
                SizedBox(width: size.width / 30),
                IconButton(
                  onPressed: () => isExpenseController.onChange(),
                  icon: const Icon(Iconsax.repeat),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
