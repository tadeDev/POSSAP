import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:possap_project/controllers/biometrics_auth_controller.dart';
import 'package:possap_project/widgets/facial_bio_success.dart';
import '../../widgets/logout_popup.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({super.key});

  final BiometricsAuthController _biometricsAuthController = Get.put(BiometricsAuthController());

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _biometricsAuthController.getRightHandList();
      _biometricsAuthController.getLeftandList();
    },);

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
                    SizedBox(
                      child: Container(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(controller.facialImage!),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "RIGHT HAND",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff112666)
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder:(context, index) {
                                return Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(controller.rightHandList[index]),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                );
                              }, 
                              separatorBuilder:(context, index) {
                                return const SizedBox(
                                  width: 20,
                                );
                              }, 
                              itemCount: controller.rightHandList.length
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "LEFT HAND",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff112666)
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder:(context, index) {
                                return Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(controller.leftHandList[index]),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                );
                              }, 
                              separatorBuilder:(context, index) {
                                return const SizedBox(
                                  width: 20,
                                );
                              }, 
                              itemCount: controller.leftHandList.length
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (){
                        controller.submit();
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
                        child: Center(
                          child: (controller.isLoading)?
                          const CircularProgressIndicator(
                            color: Colors.white,
                          )
                          :
                          const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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