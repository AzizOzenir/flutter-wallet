import 'package:wallet/exports.dart';

class NewtransactionBody extends StatelessWidget {
  const NewtransactionBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height / 7),
            SizedBox(
              height: size.height / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  xTitle(),
                  SizedBox(height: size.height / 50),
                  AmountField(),
                  SizedBox(height: size.height / 50),
                  CategorySearcher(),
                  TransactionName(),
                  DateButton(),
                ],
              ),
            ),
            SizedBox(height: size.height / 10),
            Button(),
            SizedBox(height: size.height / 40), 
          ],
        ),
      ),
    );
  }
}
