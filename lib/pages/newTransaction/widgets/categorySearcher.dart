import 'package:wallet/exports.dart';

class CategorySearcher extends StatelessWidget {
  const CategorySearcher({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CategorySearcherController categorysearchC = Provider.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      width: size.width,
      height: size.height / 12,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor, borderRadius: bRadius),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: DropdownButton(
              elevation: 0,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              iconSize: 0,
              items: categorysearchC.categories
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.name,
                      child: Row(
                        children: [
                          Icon(categorysearchC.icons[e.icon],
                              color: Colors.grey),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (String? v) {
                v != null ? categorysearchC.onCategoryChanged(v) : null;
              },
              value: categorysearchC
                  .categories[categorysearchC.selectedCategoryIndex].name),
        ),
      ),
    );
  }
}
