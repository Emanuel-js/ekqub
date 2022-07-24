import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/helpers/localization_helper.dart';
import 'package:ekub/data/wallet/model/refund_responce_model.dart';
import 'package:ekub/data/wallet/wallet_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _authControler = Get.find<AuthController>();
  final _walletController = Get.find<WalletController>();
  final _fullNameController = TextEditingController();
  final _resonController = TextEditingController();
  final _accountNoController = TextEditingController();
  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  var bankNam = [
    'CBE',
    'TELEBIRR',
    'Awash',
    'Bunna',
  ];
  String bank = "CEB";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                // profile
                Container(
                  child: TextWidget(label: "Profile"),
                ),

                //settings
                Container(
                  child: IconButton(
                      icon: const Icon(Icons.settings), onPressed: () {}),
                )
              ],
            ),
            //image
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.06),
              child: Hero(
                tag: "profile",
                child: Container(
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColor.secondaryColor,
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/300"),
                    ),
                  ),
                ),
              ),
            ),
            //name
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextWidget(
                  size: 25,
                  label: _authControler.userInfo!.username.toString()),
            ),
            //phone
            Container(
              child: TextWidget(
                  size: 20, label: _authControler.userInfo!.email.toString()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            //setting
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primaryColor),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            // language
            Container(
              child: ListTile(
                leading: const Icon(Icons.language),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "Language".tr),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    _lang();
                  },
                ),
              ),
            ),

            //
            // theme
            Container(
              child: ListTile(
                leading: Container(
                  child: Obx(
                    () => Container(
                      child: _authControler.isDarkMode
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.light_mode),
                    ),
                  ),
                ),
                title: Container(
                  alignment: Alignment.topLeft,
                  child: TextWidget(label: "Theme".tr),
                ),
                trailing: Obx(
                  () => Switch(
                    activeColor: AppColor.secondaryColor,
                    value: _authControler.isDarkMode,
                    onChanged: (value) {
                      _authControler.isDarkMode = value;
                    },
                  ),
                ),
              ),
            ),
            // // about us
            Container(
              child: ListTile(
                leading: const Icon(Icons.info),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "About us".tr),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            ),
            // contact us
            Container(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "Contact us".tr),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            ),
            //withdrawal
            Container(
              child: ListTile(
                leading: const Icon(FontAwesomeIcons.moneyBill),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "Withdrawal".tr),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    hadleRequestReFund();
                  },
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "Logout".tr),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    _authControler.logOut();
                  },
                ),
              ),
            ),
            // logout
          ],
        ),
      )),
    );
  }

  hadleRequestReFund() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: _authControler.isDarkMode
                  ? AppColor.darkBlue
                  : AppColor.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Container(
                  height: 10,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColor.lightGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  margin: EdgeInsets.only(left: Get.width * 0.057),
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    label: "Request Refund",
                    color: AppColor.black,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      controller: _fullNameController,
                      hint: "Full Name",
                      keytype: TextInputType.text,
                      icon: FontAwesomeIcons.user),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      controller: _amountController,
                      hint: "Amount",
                      keytype: TextInputType.number,
                      icon: FontAwesomeIcons.moneyBill1),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      controller: _accountNoController,
                      keytype: TextInputType.number,
                      hint: "account number",
                      icon: FontAwesomeIcons.bank),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      controller: _resonController,
                      hint: "Reason for refund",
                      icon: FontAwesomeIcons.noteSticky),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: _decoration(
                        hint: "Phone Number", icon: FontAwesomeIcons.phone),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!value.isPhoneNumber) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: DropdownButtonFormField(
                    decoration: _decoration(hint: "Select Bank"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: bankNam.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        bank = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  child: Obx(
                    () => _walletController.isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: Get.width * 0.9,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: Get.height * 0.01,
                                          vertical: 15)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              onPressed: () {
                                if (_globalKey.currentState!.validate()) {
                                  // _globalKey.currentState!.save();
                                  _walletController.requestRefund(
                                      RefundResponseModel(
                                          userId: int.parse(
                                              _authControler.userInfo!.id!),
                                          fullName: _fullNameController.text,
                                          reason: _resonController.text,
                                          amount: double.parse(
                                              _amountController.text),
                                          bankAccountNumber:
                                              _accountNoController.text,
                                          phoneForBankAccountNumber:
                                              _phoneController.text,
                                          bankName: bank));
                                }
                                if (_walletController.isRefund) {
                                  _fullNameController.clear();
                                  _amountController.clear();
                                  _accountNoController.clear();
                                  _resonController.clear();
                                  _phoneController.clear();
                                  _walletController.isRefund = false;
                                  Get.back();
                                }
                              },
                              label: TextWidget(
                                label: "request",
                                size: 16,
                              ),
                              icon: const Icon(FontAwesomeIcons.dollarSign),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                )
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,

      // isScrollControlled: true,
    );
  }

  InputDecoration _decoration({IconData? icon, String? hint}) {
    return InputDecoration(
      prefixIcon: Container(
          padding: const EdgeInsets.only(left: 10), child: Icon(icon)),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      labelText: hint,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(25.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
    );
  }

  Widget inputField(
      {required String hint,
      required TextEditingController controller,
      IconData? icon,
      TextInputType keytype = TextInputType.text}) {
    return TextFormField(
      style: const TextStyle(fontSize: 16),
      controller: controller,
      keyboardType: keytype,
      validator: (v) {
        if (v!.isEmpty) {
          return "Please insert required filed";
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
    );
  }

  _lang() {
    Get.dialog(Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(),
            Container(
              margin: const EdgeInsets.all(20),
              // color: AppColor().lightYellow,
              child: TextWidget(
                label: "Select Language".tr,
                size: 16,
              ),
            ),
            ...LocalizationService.instance.supportedLocales
                .map((Map<String, dynamic> localeInfo) => PopupMenuItem(
                    onTap: () async {
                      if (LocalizationService.instance.currentLocaleLangCode !=
                          localeInfo['languageCode']) {
                        LocalizationService.instance
                            .changeLocale(localeInfo['languageCode']);
                      }
                    },
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(localeInfo['name'],
                            style: Theme.of(context).textTheme.subtitle2))))
                .toList(),
            const Divider(
              height: 10,
            )
          ],
        ),
      ),
    ));
  }
}

//Do you want to request for refund?