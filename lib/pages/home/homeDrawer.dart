import 'package:wallet/exports.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    DateController dateC = Provider.of(context);
    ThemeController themeController = Provider.of(context);
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.grey.withOpacity(0.015),
      child: Column(
        children: [
          GestureDetector(
            child: UserAccountsDrawerHeader(
              accountName: Row(
                children: const [
                  Icon(Icons.info, color: Colors.white),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "info ",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              accountEmail: Text(
                "${dateC.today.day}-${dateC.today.month}-${dateC.today.year} ",
                style: const TextStyle(color: Colors.white),
              ),
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(12)),
                color: Colors.black,
                /*  image: DecorationImage(
                      image: AssetImage("assets/images/icon.png"),
                      fit: BoxFit.cover) */
              ),
            ),
          ),
          const SizedBox(height: 25),
          // Theme - Light
          GestureDetector(
            onTap: () => themeController.onModeChanged(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).hintColor),
              width: double.maxFinite,
              height: 100,
              child: Center(
                child: Text(themeController.isDark ? "Dark Mode" : "Light Mode",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey.shade300)),
              ),
            ),
          ),
          const SizedBox(height: 25),
          // Gradient Theme
          GestureDetector(
            onTap: () => themeController.changeGradient(),
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).hintColor),
              width: double.maxFinite,
              height: 100,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: bRadiusSoft,
                    gradient: gradients[themeController.selectedGradient],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${themeController.selectedGradient + 1}. ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade300),
                      ),
                      Text(
                        "Gradient",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
