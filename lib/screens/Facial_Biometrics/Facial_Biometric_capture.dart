import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:possap_project/controllers/biometrics_auth_controller.dart';
import 'package:possap_project/widgets/facial_bio_success.dart';
import '../../widgets/logout_popup.dart';

class FacialBiometricCapture extends StatelessWidget {
  FacialBiometricCapture({super.key});

  final BiometricsAuthController _biometricsAuthController = Get.put(BiometricsAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BiometricsAuthController>(
        builder: (controller) {
          return Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: const Color(0xffD9D9D9),
            child: SafeArea(
              child: SingleChildScrollView(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "FACIAL IMAGE",
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          Row(
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Image.asset(
                      "assets/images/PossapLogo.png",
                      height: 70,
                      width: 70,
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: const [
                          Text(
                            "POSSAP BIOMETRIC ENROLMENT",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 18,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                            image: DecorationImage(
                              image: (controller.facialImage != null) 
                                ? FileImage(controller.facialImage!)
                                : const AssetImage("assets/images/avatar.png") as ImageProvider,
                                fit: BoxFit.cover
                              )
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: (){
                              controller.getFacialImage(ImageSource.camera);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
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
                              child: Center(
                                child: (controller.isLoading)?
                                const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                :
                                const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50,),
                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context, 
                          builder: ((context) => FacialSubmittedSuccessful())
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 118,
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
                            "Continue",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),
                        )
                      ),
                    )
                  ]
                ),
              ),
            ),
          );
        }
      )
    );
  }
}