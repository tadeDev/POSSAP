import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:possap_project/controllers/biometrics_auth_controller.dart';
import 'package:possap_project/routes/app_routes_names.dart';
import 'package:possap_project/widgets/logout_popup.dart';

class FacialCaptureInfo extends StatelessWidget {
  FacialCaptureInfo({super.key});

  BiometricsAuthController _biometricsAuthController = Get.put(BiometricsAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xffD9D9D9),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  showDialog(
                    context: context, 
                    builder: ((context) => LogoutPopUp())
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    Icon(
                      Icons.logout,
                      color: Color(0xff002DC2),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: Image.asset(
                              "assets/images/PossapLogo.png",
                              height: 70,
                              width: 70,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          flex: 10,
                          child: Container(
                            child: Column(
                              children: const [
                                Text(
                                  "POSSAP BIOMETRIC ENROLMENT",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff112666)
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      "Capturing your Facial Biometrics will activate your device front camera. Well lightened environments will give best scan results",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      "Please remove any obstructions such as dark shades, face caps, face masks etc... and look into the camera.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Image.asset("assets/images/facial_bio.png"),
              const SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Get.offAllNamed(facialBiometricCapture);
                },
                child: Container(
                  height: 50,
                  width: 245,
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
                      "Capture Facial Biometrics",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}