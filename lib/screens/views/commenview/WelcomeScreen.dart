import 'package:ekub/data/helpers/localization_helper.dart';
import 'package:ekub/screens/views/admin/showmap.dart';
import 'package:ekub/screens/views/auth/login_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => LocalizationService.instance.supportedLocales
                  .map((Map<String, dynamic> localeInfo) => PopupMenuItem(
                      onTap: () async {
                        if (LocalizationService
                                .instance.currentLocaleLangCode !=
                            localeInfo['languageCode']) {
                          LocalizationService.instance
                              .changeLocale(localeInfo['languageCode']);
                        }
                      },
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(localeInfo['name'],
                              style: Theme.of(context).textTheme.subtitle2))))
                  .toList()),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          SizedBox(
              height: Get.height * 0.5,
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
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80))),
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
                      Get.to(const LoginScreen());
                    },
                    child: TextWidget(
                      label: "Login".tr,
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
                      Get.to(const ShowMap());
                    },
                    child: TextWidget(
                      label: "Register".tr,
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
