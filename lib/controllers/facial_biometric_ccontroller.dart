import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FacialBiometricController extends GetxController{
  File? _image;
  ImagePicker _imagePicker = new ImagePicker();


  File? get image => _image;
  ImagePicker get imagePicker => _imagePicker;

  
  Future<void> getImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
        source: imageSource,
        maxHeight: 500,
        maxWidth: 500,
        imageQuality: 100,
      );
      if(pickedImage != null){
        _image = File(pickedImage.path);
      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }




}