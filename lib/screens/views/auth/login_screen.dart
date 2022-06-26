import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/auth/model/auth_model.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bool _showPassword = false;
  final _globalKey = GlobalKey<FormState>();
  final _authController = Get.find<AuthController>();
  final _usernameOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            return Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: const CircleAvatar(
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height * 0.4,
              child: Lottie.asset("assets/imgs/log.json"),
            ),
            Form(
              key: _globalKey,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80))),
                width: Get.width,
                height: Get.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: inputField(
                          controller: _usernameOrEmailController,
                          hint: "የተጠቃሚ ስም ወይም ኢሜል",
                          keytype: TextInputType.text,
                          icon: Icons.person),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: inputField(
                          controller: _passwordController,
                          hint: "የይለፍ ቃል",
                          icon: Icons.lock,
                          secure: true),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: Get.width * 0.7,
                        child: Obx(
                          () => _authController.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColor.darkBlue),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 10)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)))),
                                  onPressed: () {
                                    if (_globalKey.currentState!.validate()) {
                                      _authController.login(AuthModel(
                                          password: _passwordController.text,
                                          userNameOrEmail:
                                              _usernameOrEmailController.text));
                                    }
                                  },
                                  child: TextWidget(
                                    label: "Login",
                                    size: 16,
                                  ),
                                ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputField(
      {required String hint,
      required TextEditingController controller,
      IconData? icon,
      bool secure = false,
      TextInputType keytype = TextInputType.text}) {
    return SizedBox(
      width: Get.width * 0.7,
      child: TextFormField(
        style: const TextStyle(fontSize: 16),
        controller: controller,
        keyboardType: keytype,
        obscureText: secure,
        validator: (v) {
          if (v!.isEmpty) {
            return "እባክዎ አስፈላጊውን መረጃ ያስገቡ!";
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Container(
              padding: const EdgeInsets.only(left: 10), child: Icon(icon)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          labelText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(25.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
