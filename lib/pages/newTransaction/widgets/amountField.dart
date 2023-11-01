import 'package:flutter/services.dart';
import 'package:wallet/exports.dart';

TextEditingController amountController = TextEditingController();

class AmountField extends StatelessWidget {
  const AmountField({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeController themeC = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor, borderRadius: bRadius),
      width: size.width / 1.5,
      child: TextFormField(
        controller: amountController,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            foreground: Paint()
              ..shader = gradients[themeC.selectedGradient]
                  .createShader(const Rect.fromLTWH(0, 0, 50, 25))),
        keyboardType: TextInputType.number,
        cursorWidth: 1,
        cursorColor: Colors.black,
        inputFormatters: <TextInputFormatter>[
       FilteringTextInputFormatter.allow(RegExp('[0-9]'))
],
        decoration: const InputDecoration(
          prefixIcon: Icon(Iconsax.dollar_circle),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey)),
        ),
      ),
    );
  }
}
