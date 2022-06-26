import 'package:ekub/data/admin/admin_controller.dart';
import 'package:ekub/data/maincollector/main_collector_model.dart';
import 'package:ekub/screens/views/admin/detailInformation_add.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterMainCollector extends StatefulWidget {
  const RegisterMainCollector({Key? key}) : super(key: key);

  @override
  State<RegisterMainCollector> createState() => _RegisterMainCollectorState();
}

class _RegisterMainCollectorState extends State<RegisterMainCollector> {
  final _globalKey = GlobalKey<FormState>();
  final _adminController = Get.find<AdminController>();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 30,
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Container(
                      height: 10,
                      width: 30,
                      decoration: BoxDecoration(
                          color: AppColor.black,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Container(
                      height: 10,
                      width: 30,
                      decoration: BoxDecoration(
                          color: AppColor.black,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30, bottom: 30),
                  child: TextWidget(
                    label: "አዲስ ዋና ሰብሳቢ ይመዝገቡ",
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

                Container(
                  child: Obx(
                    () => _adminController.isLoading
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
                                  _adminController.registerMainCollector(
                                      MainCollectorModel(
                                          firstName: _firstNameController.text,
                                          lastName: _lastNameController.text,
                                          email: _emailController.text,
                                          username: _userNameController.text));
                                  Get.to(() =>
                                      const RegisterMainCollectorDetailInfo());
                                }

                                if (_adminController.isLoading) {
                                  _firstNameController.clear();
                                  _lastNameController.clear();
                                  _emailController.clear();

                                  _userNameController.clear();
                                }
                              },
                              child: TextWidget(
                                label: "ቀጣይ",
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
