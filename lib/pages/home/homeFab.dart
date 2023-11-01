import 'package:wallet/exports.dart';

class HomeFAB extends StatelessWidget {
  const HomeFAB({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeController themeC = Provider.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewtransactionPage(),
        ),
      ),
      child: Container(
        width: size.width / 5.5,
        height: size.width / 5.5,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradients[themeC.selectedGradient]),
        child: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
