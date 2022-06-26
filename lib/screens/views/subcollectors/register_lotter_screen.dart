import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterLottScreen extends StatefulWidget {
  const RegisterLottScreen({Key? key}) : super(key: key);

  @override
  State<RegisterLottScreen> createState() => _RegisterLottScreenState();
}

class _RegisterLottScreenState extends State<RegisterLottScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNameController = TextEditingController();
  final _emailNameController = TextEditingController();
  final _passwordNameController = TextEditingController();

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
        body: SafeArea(
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
                    label: "Register New Lotter",
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
                    hint: "First Name",
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
                    hint: "Last Name",
                    icon: FontAwesomeIcons.user,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                    controller: _firstNameController,
                    hint: "Phone",
                    icon: FontAwesomeIcons.phone,
                    keytype: TextInputType.phone,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                    controller: _firstNameController,
                    hint: "Email",
                    icon: Icons.email,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      controller: _firstNameController,
                      hint: "Password",
                      icon: Icons.lock,
                      secure: true),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: Get.height * 0.02),
                  width: Get.width * 0.9,
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
                    },
                    child: TextWidget(
                      label: "Register",
                      size: 16,
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
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
