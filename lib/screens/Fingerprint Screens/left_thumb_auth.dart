import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:possap_project/controllers/biometrics_auth_controller.dart';
import 'package:possap_project/routes/app_routes_names.dart';

import '../../widgets/logout_popup.dart';

class LeftThumbAuth extends StatelessWidget {
  LeftThumbAuth({super.key});

  final BiometricsAuthController _biometricsAuthController = Get.put(BiometricsAuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BiometricsAuthController>(
      builder: (controller) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "LEFT HAND",
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
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff909FD3),
                            width: 5
                          ),
                          image: DecorationImage(
                            image: (controller.lTImageUrl != "")?
                            NetworkImage(controller.lTImageUrl)
                            :
                            const AssetImage("assets/images/biom.png") as ImageProvider,
                            fit: BoxFit.contain,
                          )
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: (){
                            controller.getLTBiometricsImage(ImageSource.camera);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
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
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    (controller.lTImageUrl != "")?
                    "Good!!!"
                    :
                    "Please insert left thumb",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: (controller.lTImageUrl != "")?
                      Colors.green
                      :
                      Colors.red
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "01",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.offAllNamed(leftIndexAuth);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff112666),
                                Color(0xff032289),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                            )
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}