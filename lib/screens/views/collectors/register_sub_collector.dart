import 'package:ekub/data/maincollector/main_collector_controller.dart';
import 'package:ekub/data/subcollector/sub_collector_model.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterSubCollector extends StatefulWidget {
  const RegisterSubCollector({Key? key}) : super(key: key);

  @override
  State<RegisterSubCollector> createState() => _RegisterSubCollectorState();
}

class _RegisterSubCollectorState extends State<RegisterSubCollector> {
  final _globalKey = GlobalKey<FormState>();
  final _mainCollector = Get.find<MainCollectorController>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  // final _phoneNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          leading: Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              child: CircleAvatar(
                backgroundColor: AppColor.secondaryColor,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.white,
                  ),
                ),
              )),
        ),
        body: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30, bottom: 30),
                  child: TextWidget(
                    label: "አዲስ ሻጭ ይመዝገቡ",
                    color: AppColor.black,
                    ftw: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                    controller: _firstNameController,
                    hint: "የመጀመሪያ ስም",
                    icon: FontAwesomeIcons.user,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                    controller: _lastNameController,
                    hint: "ያባት ስም",
                    icon: FontAwesomeIcons.user,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                    controller: _userNameController,
                    hint: "የተጠቃሚ ስም",
                    icon: FontAwesomeIcons.user,
                  ),
                ),

                // SizedBox(
                //   height: Get.height * 0.03,
                // ),
                // SizedBox(
                //   width: Get.width * 0.9,
                //   child: inputField(
                //     controller: _firstNameController,
                //     hint: "Phone",
                //     icon: FontAwesomeIcons.phone,
                //     keytype: TextInputType.phone,
                //   ),
                // ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                    width: Get.width * 0.9,
                    child: TextFormField(
                        style: const TextStyle(fontSize: 16),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please insert required filed";
                          }
                          if (!v.isEmail) {
                            return "your Email is not correct";
                          }
                          return null;
                        },
                        decoration:
                            inputStyles(hint: "ኢሜይል", icon: Icons.email))),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      controller: _passwordNameController,
                      hint: "የይለፍ ቃል",
                      icon: Icons.lock,
                      secure: true),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  child: Obx(
                    () => _mainCollector.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            padding: EdgeInsets.only(bottom: Get.height * 0.02),
                            width: Get.width * 0.9,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
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
                                  _mainCollector.registerSubCollector(
                                      SubCollectorModel(
                                          firstName: _firstNameController.text,
                                          lastName: _lastNameController.text,
                                          email: _emailController.text,
                                          username: _userNameController.text));
                                }
                                if (_mainCollector.isLoading) {
                                  _firstNameController.clear();
                                  _lastNameController.clear();
                                  _emailController.clear();
                                  _passwordNameController.clear();
                                  _userNameController.clear();
                                }
                              },
                              child: TextWidget(
                                label: "ይመዝግቡ",
                                size: 16,
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ));
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
          obscureText: secure,
          style: const TextStyle(fontSize: 16),
          controller: controller,
          keyboardType: keytype,
          validator: (v) {
            if (v!.isEmpty) {
              return "Please insert required filed";
            }
            return null;
          },
          decoration: inputStyles(hint: hint, icon: icon)),
    );
  }

  InputDecoration inputStyles({required String hint, required var icon}) {
    return InputDecoration(
      prefixIcon: Container(
          padding: const EdgeInsets.only(left: 10), child: Icon(icon)),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      labelText: hint,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
    );
  }
}
