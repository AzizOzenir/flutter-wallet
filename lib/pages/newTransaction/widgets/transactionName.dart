import 'package:wallet/exports.dart';

TextEditingController transactionNameController = TextEditingController();

class TransactionName extends StatelessWidget {
  const TransactionName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: bRadius,
        ),
        child: TextFormField(
          controller: transactionNameController,
          cursorColor: Colors.grey,
          cursorWidth: 1,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            hintText: "Enter Transaction Name",
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
            prefixIcon: const Icon(Iconsax.note_1),
            prefixIconColor: Colors.black,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            border: OutlineInputBorder(
                borderRadius: bRadius, borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
