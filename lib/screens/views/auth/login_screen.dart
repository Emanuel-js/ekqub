import 'package:ekub/screens/views/users/user_main_screen.dart';
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
  final _phoneController = TextEditingController();
  final _passordController = TextEditingController();
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Lottie.asset("assets/imgs/log.json"),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(120),
                        topRight: Radius.circular(120))),
                height: Get.height * 0.5,
                width: Get.width,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: inputField(
                            controller: _phoneController,
                            hint: "Phone",
                            icon: Icons.phone),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: inputField(
                            controller: _phoneController,
                            hint: "Phone",
                            icon: Icons.phone),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColor.darkBlue),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          onPressed: () {
                            //todo
                            Get.off(const UserMainScreen());
                          },
                          child: TextWidget(
                            label: "Login",
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  ),
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
      TextInputType keytype = TextInputType.text}) {
    return SizedBox(
      width: Get.width * 0.7,
      child: TextFormField(
        style: const TextStyle(fontSize: 16),
        controller: controller,
        keyboardType: keytype,
        validator: (v) {
          if (v!.isEmpty) {
            return "Please insret required filed";
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
