import 'package:wallet/exports.dart';

// ignore: must_be_immutable
class Transaction extends StatelessWidget {
  int index;
  Transaction({required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HiveDB dbC = Provider.of(context);
    DateController dateC = Provider.of(context);
    CategorySearcherController categorySearcherC = Provider.of(context);
    ThemeController themeC = Provider.of(context);

    return Dismissible(
      key: UniqueKey(),
      behavior: HitTestBehavior.deferToChild,
      direction: DismissDirection.horizontal,
      onDismissed: (d) => dbC.deleteTransaction(index),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(35)),
              width: size.width - 25,
              height: size.height / 7,
            ),
            Positioned(
              right: (size.width / 1.4),
              child: Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                    gradient: gradients[themeC.selectedGradient],
                    shape: BoxShape.circle),
                child: Icon(categorySearcherC
                    .icons[dbC.allTransactions[index].categoryIndex]),
              ),
            ),
            Text(dbC.allTransactions[index].name.isEmpty
                ? ""
                : dbC.allTransactions[index].name),
            Positioned(
              left: (size.width / 1.5),
              child: SizedBox(
                width: size.width / 4,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      " ${"€"} ${dbC.allTransactions[index].value}",
                      style: TextStyle(
                          color: dbC.allTransactions[index].isExpense
                              ? Colors.red
                              : Colors.green,
                          fontSize: 17),
                    ),
                    Text(
                      dbC.allTransactions[index].date == dateC.today
                          ? "Today"
                          : dbC.allTransactions[index].date ==
                                  dateC.today.day - 1
                              ? "Yesterday"
                              : dbC.allTransactions[index].date
                                  .substring(0, 10),
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
