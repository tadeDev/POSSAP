import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiometricsAuthBottomSheet{
  static showBiometricsAuthBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 300,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Container(
                      height: 5,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Vector.png"),
                        const SizedBox(width: 15,),
                        const Text(
                          "Authentication Required",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Fingerprint for Login.png",
                          color: const Color(0xff0028AE),
                        ),
                        const SizedBox(width: 15,),
                        const Text(
                          "Touch Fingerprint Sensor",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){}, 
                      child: const Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                    )
                  ]
                ),
              )
            )
          ]
        ),
      )
    );
  }
}