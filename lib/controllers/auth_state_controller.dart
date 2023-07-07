import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../routes/app_routes_names.dart';
import '../services/auth_api_services.dart';
import '../storage/secureStorage.dart';

class AuthStateController extends GetxController{
  // INSTANT VARIABLES
  bool _hidePassword = true;
  bool _isChecked = false;
  String _email = "";
  String _password = ""; 
  bool _isLoading = false;

  // GETTERS
  bool get hidePassword => _hidePassword;
  bool get isChecked => _isChecked;
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;

  // SETTERS
  toggleHidePassword() {
    _hidePassword = !_hidePassword;
    update();
  } // TOGGLE PASSWORD
  updateIsChecked(value) {
    _isChecked = value;
    update();
  } // UPDATE CHECKBOX
  toggleIsChecked() {
    _isChecked = !_isChecked;
    update();
  } // TOGGLE CHECKBOX

  updateEmail(value) {
    _email = value;
    update;
  }
  updatePassword(value) {
    _password = value;
    update;
  }
  updateIsLoading(value) {
    _isLoading = value;
    update;
  }

  // LOGIN USER
  Future<void> loginUser() async{
    updateIsLoading(true);

    Map<String, dynamic> loginUserDetails = {
      "email": _email,
      "password": _password,
    };

    print("DETAILS:::$loginUserDetails");

    var response = await AuthApiServices.loginUserService(loginUserDetails);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    bool isSuccess = responseData["Error"];

    if(!isSuccess){
      updateIsLoading(false);

      await LocalStorage().storeUserToken(responseData["ResponseObject"]);

      Fluttertoast.showToast(
        msg: "Login Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

      Get.offAllNamed(biometricEnrollment);
      
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
  
}