import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageController extends ChangeNotifier {
  File? image;
  String? imagePath;

  void PickImage() async {
    SharedPreferences SP = await SharedPreferences.getInstance();
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      imagePath = xFile.path;
      image = File(imagePath!);
      SP.setString("path", image!.path);
      notifyListeners();
    }
  }

  void saveImage(String path) async {
    SharedPreferences SP = await SharedPreferences.getInstance();

    SP.setString("path", path);
  }

  void loadImage() async {
    SharedPreferences SP = await SharedPreferences.getInstance();

    String? x = SP.getString("path");
    if (x != null) {
      imagePath = x;
      FileImage w = FileImage(File(imagePath!));
      image = w.file;
      notifyListeners();
    }
  }

  // Here is name controller
  String name = "get a name..";

  void SharedPreferencesInput(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', text);
    String? newname = prefs.getString('name');
    name = newname!;
    notifyListeners();
  }

  void SharedPreferencesOutput() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("name")) {
      String? newname = prefs.getString('name');
      name = newname!;
      notifyListeners();
    }
  }
}
