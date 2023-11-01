import 'package:flutter/scheduler.dart';
import 'package:wallet/exports.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    ImageController controllerImage = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 55,
      width: size.width - 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controllerImage.PickImage();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    height: 55,
                    width: 55,
                    color: controllerImage.image == null
                        ? Colors.grey.shade900
                        : null,
                    child: controllerImage.image == null
                        ? const Center(
                            child: Text(
                              "Add Image",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 10),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: Image(
                                image: FileImage(controllerImage.image!),
                                fit: BoxFit.cover),
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SchedulerBinding.instance!.addPostFrameCallback((_) {
                    customDialog(context);
                    //your dialog
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "welcome",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey),
                    ),
                    Text(
                      controllerImage.name,
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: bRadius),
                  width: 44,
                  height: 44,
                  child: Icon(
                    Iconsax.setting,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  customDialog(BuildContext context) {
    TextEditingController formController = TextEditingController();
    ImageController controllerImage = Provider.of(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: formController,
                  decoration: InputDecoration(
                    labelText: 'Enter Text',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              
              onPressed: () {
                controllerImage.SharedPreferencesInput(formController.text);

                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),

    );
  }
}
