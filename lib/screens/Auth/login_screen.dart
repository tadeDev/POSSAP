import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:possap_project/controllers/auth_state_controller.dart';
import 'package:possap_project/routes/app_routes_names.dart';
import 'package:possap_project/widgets/biometrics_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthStateController>(
        builder: (controller) {
          return Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff909FD3),
                  Color(0xffA5AFD0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/PossapLogo.png", height: 108, width: 108,),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Welcome",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff112666),
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter your credentials",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),   
                    const SizedBox(
                      height: 30,
                    ),     
                    Container(
                      height: 400,
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xffFFFFFF).withOpacity(0.5),
                            const Color(0xffFFFFFF).withOpacity(0.3),
                            const Color(0xffFFFFFF).withOpacity(0.2),
                            const Color(0xffFFFFFF).withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Colors.white,
                          width: 3
                        )
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/Vector.png",
                                        color: const Color(0xff112666),
                                        height: 17,
                                        width: 15,
                                      ),
                                      const SizedBox(width: 10,),
                                      const Text(
                                        "Email",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff112666),
                                          fontSize: 18
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    height: 55,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xff9EB4FF).withOpacity(0.4)
                                      ),
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none
                                          ),
                                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                          hintText: "Enter Email",
                                          hintStyle: TextStyle(
                                            color: Color(0xff959595)
                                          )
                                        ),
                                        onChanged: (value){
                                          controller.updateEmail(value);
                                        }
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.lock,
                                        size: 18,
                                        color: Color(0xff001659),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        "Password",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff112666),
                                          fontSize: 18
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    height: 55,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xff9EB4FF).withOpacity(0.4)
                                      )
                                    ),
                                    child: Center(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                          hintText: "Enter Password",
                                          hintStyle: const TextStyle(
                                            color: Color(0xff959595)
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: (){
                                              controller.toggleHidePassword();
                                            }, 
                                            icon: Icon(
                                              (controller.hidePassword)?
                                              (
                                                Icons.visibility_off
                                              ):
                                              (
                                                Icons.visibility
                                              ),
                                              color: const Color(0xff909FD3),
                                              size: 20,
                                            )
                                          )
                                        ),
                                        obscureText: controller.hidePassword,
                                        onChanged: (value){
                                          controller.updatePassword(value);
                                        }
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: controller.isChecked, 
                                  onChanged: (value){
                                    controller.toggleIsChecked();
                                  }
                                ),
                                const Text(
                                  "Remember me",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                                ), 
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 14,
                                  child: InkWell(
                                    onTap: (){
                                      (_formKey.currentState!.validate())?
                                      controller.loginUser()
                                      :
                                      AutovalidateMode.disabled;
                                    },
                                    child: Container(
                                      height: 60,
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
                                          color: Colors.white
                                        )
                                        :
                                        const Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white
                                          ),
                                        ),
                                      )
                                    ),
                                  )
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: InkWell(
                                      onTap: (){
                                        BiometricsAuthBottomSheet.showBiometricsAuthBottomSheet();
                                      },
                                      child: Image.asset("assets/images/Fingerprint for Login.png")
                                    )
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}