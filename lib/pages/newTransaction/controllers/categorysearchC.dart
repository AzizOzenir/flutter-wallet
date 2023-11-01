import '../../../exports.dart';

class CategorySearcherController with ChangeNotifier {
  late CategoryModel selectedItem = categories.first;
  int selectedCategoryIndex = 0;
  List<CategoryModel> categories = [
    CategoryModel(name: "Entertainment", icon: 0),
    CategoryModel(name: "Education", icon: 1),
    CategoryModel(name: "Repairments", icon: 2),
    CategoryModel(name: "Vehichle Payments", icon: 3),
    CategoryModel(name: "Fuel", icon: 4),
    CategoryModel(name: "Travel", icon: 5),
    CategoryModel(name: "Shopping", icon: 6),
    CategoryModel(name: "Bills", icon: 7),
    CategoryModel(name: "Healthcares", icon: 8),
    CategoryModel(name: "Insurances", icon: 9),
    CategoryModel(name: "Taxes", icon: 10),
    CategoryModel(name: "Debts", icon: 11),
  ];

  onCategoryChanged(String v) {
    for (int i = 0; i < categories.length; i++) {
      if (v == categories[i].name) {
        selectedItem = categories[i];
        selectedCategoryIndex = i;
        notifyListeners();
      } else {
        null;
      }
    }
  }

  List icons = [
    Iconsax.happyemoji,
    Iconsax.book,
    Iconsax.setting,
    Iconsax.car,
    Iconsax.safe_home,
    Iconsax.airplane,
    Iconsax.shop,
    Iconsax.bill,
    Iconsax.hospital,
    Iconsax.shield,
    Iconsax.building,
    Iconsax.courthouse
  ];
}
