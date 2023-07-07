import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../routes/app_routes_names.dart';
import '../services/biometrics_api_services.dart';
import '../storage/secureStorage.dart';
import '../widgets/fingerprint_submitted.dart';

class BiometricsAuthController extends GetxController{
  // INSTANT VARIABLES
  bool _biometricsCaptured = false;
  File? _biometricsImage;
  bool _isLoading = false;
  File? _facialImage;
  ImagePicker _imagePicker = new ImagePicker();
  String _rTImageUrl = "";
  String _rIImageUrl = "";
  String _rMImageUrl = "";
  String _rRImageUrl = "";
  String _rPImageUrl = "";
  String _lTImageUrl = "";
  String _lIImageUrl = "";
  String _lMImageUrl = "";
  String _lRImageUrl = "";
  String _lPImageUrl = "";
  List<dynamic> _rightHandList = [];
  List<dynamic> _leftHandList = [];

  // GETTERS
  bool get biometricsCaptured => _biometricsCaptured;
  File? get biometricsImage => _biometricsImage;
  bool get isLoading => _isLoading;
  File? get facialImage => _facialImage;
  ImagePicker get imagePicker => _imagePicker;
  String get rTImageUrl => _rTImageUrl;
  String get rIImageUrl => _rIImageUrl;
  String get rMImageUrl => _rMImageUrl;
  String get rRImageUrl => _rRImageUrl;
  String get rPImageUrl => _rPImageUrl;
  String get lTImageUrl => _lTImageUrl;
  String get lIImageUrl => _lIImageUrl;
  String get lMImageUrl => _lMImageUrl;
  String get lRImageUrl => _lRImageUrl;
  String get lPImageUrl => _lPImageUrl;
  List get leftHandList => _leftHandList;
  List get rightHandList => _rightHandList;

  //SETTERS
  toggleBiometricsCaptured (){
    _biometricsCaptured = !_biometricsCaptured;
    update();
  }
  updateBiometricsImage (value){
    _biometricsImage = value;
    update();
  }
  updateFacialImage (value){
    _facialImage = value;
    update();
  }
  updateIsLoading (value){
    _isLoading = value;
    update();
  }
  updateRightHandList(value){
    _rightHandList = value;
    update();
  }
  updateLeftHandList(value){
    _leftHandList = value;
    update();
  }

  Future<void> getFacialImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
        source: imageSource,
        imageQuality: 100,
      );
      if(pickedImage != null){

        _facialImage = File(pickedImage.path);

        List<int> imageBytes = await _facialImage!.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        print(base64Image);

        await LocalStorage().storeFacialImage(base64Image);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getRTBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);
        sendRTImageToReciever(_biometricsImage);
      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getRIBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendRIImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getRMBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendRMImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getRRBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendRRImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getRPBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendRPImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getLTBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendLTImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getLIBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendLIImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getLMBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendLMImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getLRBiometricsImage(ImageSource imageSource) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendLRImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  Future<void> getLPBiometricsImage(ImageSource imageSource, BuildContext context) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
          source: imageSource,
          imageQuality: 100,
          preferredCameraDevice: CameraDevice.rear
      );
      if(pickedImage != null){
        _biometricsImage = File(pickedImage.path);

        sendLPImageToReciever(_biometricsImage);

      }else{
        Get.snackbar("Alert", "No image selected");
      }
    } catch (error) {
      print(error);
    }

    update();
  }

  // SEND IMAGE TO RECIEVER
  Future<void> sendRTImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

      await LocalStorage().storeUserRightThumb(responseData["data"]["image-uri"]);
      
      _rTImageUrl = responseData["data"]["image-uri"];

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
    update();
  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendRIImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

      await LocalStorage().storeUserRightIndex(responseData["data"]["image-uri"]);
      
      _rIImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
      
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendRMImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

      await LocalStorage().storeUserRightMiddle(responseData["data"]["image-uri"]);
      
      _rMImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendRRImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

     await LocalStorage().storeUserRightRing(responseData["data"]["image-uri"]);
      
     _rRImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendRPImageToReciever(dynamic file) async{
    updateIsLoading(true);
    
    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

     await LocalStorage().storeUserRightPinky(responseData["data"]["image-uri"]);
      
     _rPImageUrl = responseData["data"]["image-uri"];

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

  // SEND IMAGE TO RECIEVER
  Future<void> sendLTImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

     await LocalStorage().storeUserLeftThumb(responseData["data"]["image-uri"]);
      
     _lTImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendLIImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

     await LocalStorage().storeUserLeftIndex(responseData["data"]["image-uri"]);
      
     _lIImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendLMImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    if(response.statusCode == 200){
      updateIsLoading(false);

     await LocalStorage().storeUserLeftMiddle(responseData["data"]["image-uri"]);
      
     _lMImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendLRImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

     await LocalStorage().storeUserLeftRing(responseData["data"]["image-uri"]);
      
     _lRImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SEND IMAGE TO RECIEVER
  Future<void> sendLPImageToReciever(dynamic file) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.sendImageToRecieverService(file);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode == 200){
      updateIsLoading(false);

     await LocalStorage().storeUserLeftPinky(responseData["data"]["image-uri"]);
      
     _lPImageUrl = responseData["data"]["image-uri"];

      Fluttertoast.showToast(
        msg: "Image Processed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Failed!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

  // VIEW UPLOADS
  Future<void> viewUploads(String url) async{
    updateIsLoading(true);

    var response = await BiometricsApiService.viewUploadsService(url);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    bool isError = responseData["Error"];

    if(isError == false){
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Retrieved Successfully!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
      
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["error"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SUBMIT BIOMETRICS & FACIAL
  Future<void> submit() async{
    updateIsLoading(true);

    String rightThumb = await LocalStorage().fetchUserRightThumb();
    String rightIndex = await LocalStorage().fetchUserRightIndex();
    String rightMiddle = await LocalStorage().fetchUserRightMiddle();
    String rightRing = await LocalStorage().fetchUserRightRing();
    String rightPinky = await LocalStorage().fetchUserRightPinky();
    String leftThumb = await LocalStorage().fetchUserLeftThumb();
    String leftIndex = await LocalStorage().fetchUserLeftIndex();
    String leftMiddle = await LocalStorage().fetchUserLeftMiddle();
    String leftRing = await LocalStorage().fetchUserLeftRing();
    String leftPinky = await LocalStorage().fetchUserLeftPinky();
    String token = await LocalStorage().fetchUserToken();
    String image = await LocalStorage().fetchFacialImage();

    Map<String, dynamic> details = {
      "FileNumber" : "CHC0000000000",
      "Comment" : "This is okay i think this is fine",
      "RightThumb" : rightThumb,
      "RightIndex" : rightIndex,
      "RightMiddle" : rightMiddle,
      "RightRing" : rightRing,
      "RightPinky" : rightPinky,
      "LeftThumb" : leftThumb,
      "LeftIndex" : leftIndex,
      "LeftMiddle" : leftMiddle,
      "LeftRing" : leftRing,
      "LeftPinky" : leftPinky,
      "Token" : token,
      "PassportImage" : image,
      "RegisteredDate" : DateTime.now.toString().split(" ").first
    };
    print(details);

    var response = await BiometricsApiService.submitService(details);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    if(response.statusCode  == 200) {
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["ResponseObject"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["ResponseObject"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // GET RIGHT HAND
  Future<void> getRightHandList() async{
    String rightThumb = await LocalStorage().fetchUserRightThumb();
    String rightIndex = await LocalStorage().fetchUserRightIndex();
    String rightMiddle = await LocalStorage().fetchUserRightMiddle();
    String rightRing = await LocalStorage().fetchUserRightRing();
    String rightPinky = await LocalStorage().fetchUserRightPinky();

    List _list = [
      rightThumb,
      rightIndex,
      rightMiddle,
      rightMiddle,
      rightPinky
    ];
    
    updateRightHandList(_list);
    
    update();
  }
  
  // GET LEFT HAND
  Future<void> getLeftandList() async{
    String leftThumb = await LocalStorage().fetchUserLeftThumb();
    String leftIndex = await LocalStorage().fetchUserLeftIndex();
    String leftMiddle = await LocalStorage().fetchUserLeftMiddle();
    String leftRing = await LocalStorage().fetchUserLeftRing();
    String leftPinky = await LocalStorage().fetchUserLeftPinky();

    List _list = [
      leftThumb,
      leftIndex,
      leftMiddle,
      leftRing,
      leftPinky
    ];
    
    updateLeftHandList(_list);

    update();
  }
   
}