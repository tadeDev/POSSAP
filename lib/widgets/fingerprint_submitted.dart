import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes_names.dart';

class SubmittedSuccessful extends StatelessWidget {
  const SubmittedSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Fingerprint Submitted Successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: Color(0xff112666),
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20,),
          Image.asset("assets/images/fingerprint_verification.png")
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 30),
      actions: [
        InkWell(
          onTap: (){
            Get.offAllNamed(facialCaptureInfo);
          },
          child: Container(
            height: 48,
            width: 250,
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
                "Proceed to Facial Capture",
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