import 'package:wallet/exports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: size.height / 18),
            const ProfileContainer(),
            SizedBox(height: size.height / 40),
            const BalanceContainer(),
            SizedBox(height: size.height / 40),
            const TransactionHead(),
            const Transactions(),
          ],
        ),
      ),
    );
  }
}
