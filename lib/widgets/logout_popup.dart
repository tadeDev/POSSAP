import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes_names.dart';

class LogoutPopUp extends StatelessWidget {
  const LogoutPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Logout ?",
        style: TextStyle(
          fontSize: 20
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Are you sure you want to logout ?",
            style: TextStyle(
              fontSize: 13
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Please note that data not yet submitted will be lost",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.red
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 30),
      buttonPadding: EdgeInsets.only(left: 50),
      actions: [
        InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            height: 48,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffDDDDDD)
            ),
            child: const Center(
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            )
          ),
        ),
        InkWell(
          onTap: (){
            Get.toNamed(loginScreen);
          },
          child: Container(
            height: 48,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff112666),
                  Color(0xff032289),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            child: const Center(
              child: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}