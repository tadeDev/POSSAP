import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:possap_project/routes/app_routes_names.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backround_image.png"), // BACKGROUND IMAGE
            fit: BoxFit.cover
          )
        ),
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: const Color(0xff001659).withOpacity(0.8),
          child: SafeArea(
            child: Column(
              children: [
                Image.asset("assets/images/banner.png",), // TOP BANNER
                const SizedBox(
                  height: 50,
                ),
                Image.asset("assets/images/PossapLogo.png",), // POSSAP LOGO
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Welcome to the Police Specialized Automation Services (POSSAP)", // INTRO WRITE UP
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended( // FLOATING ACTION BUTTON
        onPressed: (){
          Get.toNamed(loginScreen);
        },
        backgroundColor: const Color(0xffF2E704),
        label: Row(
          children: const [
            Text(
              "Continue",
              style: TextStyle(
                color: Colors.black
              ),
            ),
            SizedBox(width: 10,),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            )
          ],
        )
      ),
    );
  }
}