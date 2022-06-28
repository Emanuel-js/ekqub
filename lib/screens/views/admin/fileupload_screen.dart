import 'package:ekub/data/admin/admin_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class MainCollectorFileUpload extends StatefulWidget {
  const MainCollectorFileUpload({Key? key}) : super(key: key);

  @override
  State<MainCollectorFileUpload> createState() =>
      _MainCollectorFileUploadState();
}

class _MainCollectorFileUploadState extends State<MainCollectorFileUpload> {
  final _globalKey = GlobalKey<FormState>();
  final _adminController = Get.find<AdminController>();
  final _phoneNumberController = TextEditingController();
  final _alternatePhoneNumberController = TextEditingController();

  final _residentLocationController = TextEditingController();
  // final _phoneNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _yearBornController = TextEditingController();
  final _genderController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  DateTime selectedDate = DateTime.now();

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
                    controller: _phoneNumberController,
                    hint: "ስልክ ቁጥር",
                    icon: FontAwesomeIcons.phone,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                    controller: _alternatePhoneNumberController,
                    hint: "ስልክ ቁጥር(አማራጭ)",
                    icon: FontAwesomeIcons.phone,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
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
                        side: BorderSide(color: AppColor.darkGray),
                        primary: AppColor.primaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
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
                          label: "የትውልድ ቀን",
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
                    femaleText: "ሴት",
                    maleText: "ወንድ",
                    selectedGender: Gender.Male,
                    selectedGenderTextStyle: TextStyle(
                        color: AppColor.darkGray, fontWeight: FontWeight.bold),
                    unSelectedGenderTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    onChanged: (gender) {
                      print(gender);
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
                  child: inputField(
                      controller: _latitudeController,
                      hint: "አድራሻ",
                      icon: Icons.location_on,
                      secure: true),
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
                                backgroundColor: AppColor.darkBlue,
                                child: const Icon(Icons.arrow_back_ios),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(bottom: Get.height * 0.02),
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
                                  if (_globalKey.currentState!.validate()) {}
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
        firstDate: DateTime(2015, 8),
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
