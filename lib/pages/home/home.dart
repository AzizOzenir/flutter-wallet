import 'package:wallet/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ImageController imageC = Provider.of(context);
    Future.delayed(const Duration(milliseconds: 1), () {
      imageC.loadImage();
      imageC.SharedPreferencesOutput();
    });
    return const Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: HomeBody(),
      endDrawer: HomeDrawer(),
      floatingActionButton: HomeFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
