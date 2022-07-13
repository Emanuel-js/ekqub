import 'dart:developer';
import 'dart:io';

import 'package:ekub/data/admin/admin_controller.dart';
import 'package:ekub/data/user/model/user.dart';
import 'package:ekub/screens/views/admin/fileupload_screen.dart';
import 'package:ekub/screens/views/admin/search_map.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class RegisterMainCollectorDetailInfo extends StatefulWidget {
  const RegisterMainCollectorDetailInfo({Key? key}) : super(key: key);

  @override
  State<RegisterMainCollectorDetailInfo> createState() =>
      _RegisterMainCollectorDetailInfoState();
}

class _RegisterMainCollectorDetailInfoState
    extends State<RegisterMainCollectorDetailInfo> {
  final _globalKey = GlobalKey<FormState>();
  final _adminController = Get.find<AdminController>();

  final _residentLocationController = TextEditingController();
  final _cityController = TextEditingController();
  final _yearBornController = TextEditingController();
  String _genderController = "Male";

  DateTime selectedDate = DateTime.now();
  late File _filePath;

  @override
  Widget build(BuildContext context) {
    log(_adminController.log.toString());
    return Scaffold(
        body: Form(
      key: _globalKey,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
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
                      color: AppColor.primaryColor,
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
                controller: _cityController,
                hint: "ከተማ",
                icon: FontAwesomeIcons.city,
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: Container(
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.date_range,
                    color: AppColor.darkGray,
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColor.lightBlue),
                    primary: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {
                    {
                      _selectDate(context);
                    }
                  },
                  label: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 10),
                    child: TextWidget(
                      label: "የትውልድ ቀን" " " +
                          selectedDate.year.toString() +
                          "/" +
                          selectedDate.month.toString() +
                          "/" +
                          selectedDate.day.toString(),
                      color: AppColor.darkGray,
                      txa: TextAlign.start,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              child: GenderPickerWithImage(
                verticalAlignedText: false,

                selectedGender: Gender.Male,
                selectedGenderTextStyle: TextStyle(
                    color: AppColor.darkGray, fontWeight: FontWeight.bold),
                unSelectedGenderTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
                onChanged: (Gender? gender) {
                  _genderController =
                      gender.toString().replaceAll("Gender.", "");
                },
                equallyAligned: true,
                animationDuration: const Duration(milliseconds: 300),
                isCircular: true,
                // default : true,
                opacityOfGradient: 0.4,
                padding: const EdgeInsets.all(3),
                size: 50, //default : 40
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: Container(
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.location_on,
                    color: AppColor.darkGray,
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColor.lightBlue),
                    primary: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {
                    {
                      Get.to(const SearchPlacesScreen());
                    }
                  },
                  label: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 10),
                    child: Obx(() => TextWidget(
                          label: _adminController.lat != null
                              ? "ቦታ ተመርጧል"
                              : "ቦታ ይምረጡ",
                          color: AppColor.darkGray,
                          txa: TextAlign.start,
                          size: 16,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              child: Obx(() => _adminController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColor.secondaryColor,
                            child: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: Get.height * 0.02),
                          width: Get.width * 0.5,
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
                              if (_globalKey.currentState!.validate() &&
                                  _adminController.lat != null) {
                                _adminController.mainCollectorReq = UserModel(
                                  city: _cityController.text,
                                  yearBorn: selectedDate,
                                  gender: _genderController,
                                  longitude: _adminController.lat,
                                  latitude: _adminController.log,
                                  firstName: _adminController
                                      .mainCollectorReq!.firstName,
                                  lastName: _adminController
                                      .mainCollectorReq!.lastName,
                                  email:
                                      _adminController.mainCollectorReq!.email,
                                  phoneNumber: _adminController
                                      .mainCollectorReq!.phoneNumber,
                                  alternatePhoneNumber: _adminController
                                      .mainCollectorReq!.alternatePhoneNumber,
                                );
                                Get.to(() => const MainCollectorFileUpload());
                              }
                              if (_adminController.lat == null) {
                                Get.snackbar(
                                  "ስህተት",
                                  "ቦታ ይምረጡ",
                                  backgroundColor: AppColor.darkBlue,
                                  colorText: AppColor.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: const Duration(seconds: 2),
                                );
                              }
                            },
                            child: TextWidget(
                              label: "ቀጣይ",
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    )),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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
