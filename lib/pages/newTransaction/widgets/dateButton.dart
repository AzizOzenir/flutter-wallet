import 'package:bottom_picker/bottom_picker.dart';
import 'package:wallet/exports.dart';

class DateButton extends StatelessWidget {
  const DateButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateController DateC = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: GestureDetector(
        onTap: () {
          BottomPicker.dateTime(
            title: "Set the event exact time and date",
            titleStyle: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
            onSubmit: (date) {
             DateC.onChanged(date);
            },
            onClose: () {
              print("Picker closed");
            },
            buttonText: 'Confirm',
            buttonTextStyle: const TextStyle(color: Colors.white),
            buttonSingleColor: Colors.pink,
            minDateTime: DateTime(2021, 5, 1),
            maxDateTime: DateTime(2021, 8, 2),
          ).show(context);

          /* DatePicker.showDatePicker(context,
              theme: const DatePickerTheme(
                  headerColor: Colors.white, backgroundColor: Colors.white),
              showTitleActions: true,
              minTime: DateTime(2022, 1, 1),
              maxTime: DateTime(2023, 12, 31), onConfirm: (date) {
            DateC.onChanged(date);
          }, currentTime: DateC.dateTime, locale: LocaleType.en); */
        },
        child: Container(
          width: size.width,
          height: size.height / 12,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor, borderRadius: bRadius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Icon(
                  Iconsax.calendar,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                  DateC.isChanged
                      ? "${DateC.dateTime.day}/${DateC.dateTime.month}/${DateC.dateTime.year}"
                      : "Today ?",
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
