import 'package:ekub/screens/views/auth/login_screen.dart';
import 'package:ekub/screens/views/auth/register_screen.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          SizedBox(
              width: Get.width,
              child: const Image(
                image: AssetImage("assets/imgs/logo.png"),
              )),
          Container(
            height: Get.height * 0.4,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(120),
                    topRight: Radius.circular(120))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.primaryColor),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {
                      //todo
                      Get.off(const LoginScreen());
                    },
                    child: TextWidget(
                      label: "Login",
                      size: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.darkBlue),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {
                      //todo
                      Get.off(const RegiserScreen());
                    },
                    child: TextWidget(
                      label: "Register",
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          )
          //bottem
        ],
      ),
    );
  }
}
