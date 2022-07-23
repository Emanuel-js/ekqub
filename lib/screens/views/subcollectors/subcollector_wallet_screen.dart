import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/wallet/model/transaction_model.dart';
import 'package:ekub/data/wallet/wallet_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SubCollectorWalletScreen extends StatefulWidget {
  const SubCollectorWalletScreen({Key? key}) : super(key: key);

  @override
  State<SubCollectorWalletScreen> createState() =>
      _SubCollectorWalletScreenState();
}

class _SubCollectorWalletScreenState extends State<SubCollectorWalletScreen> {
  final _walletController = Get.find<WalletController>();
  final _authController = Get.find<AuthController>();

  final _amountController = TextEditingController();

  final _phoneController = TextEditingController();

  final _remarkController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: "transferto",
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            FontAwesomeIcons.moneyBillTransfer,
            color: AppColor.white,
          ),
          onPressed: () {
            transfer();
          }),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.darkBlue,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    )),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.33,
                child: AppBar(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  )),
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
                  backgroundColor: AppColor.darkBlue,
                  elevation: 0,
                  actions: [
                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 20),
                        child: TextWidget(label: "Wallet"))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 25.0, right: 15.0, top: Get.height * 0.18),
                child: TextWidget(
                  label: "My Account: ${_walletController.myWallet?.account}",
                  color: AppColor.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: Get.height * 0.23),
                child: Column(
                  children: [
                    Obx(
                      () => _cards(
                          title: "Wallet Balance",
                          data: "${_walletController.myWallet?.balance} ETB",
                          icon: FontAwesomeIcons.wallet),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20, top: 10),
            child: TextWidget(
              label: "Transaction History",
              color: AppColor.black,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _transactionList(),
                _transactionList(),
                _transactionList(),
                _transactionList(),
                _transactionList(),
                _transactionList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  transfer() {
    Get.bottomSheet(SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Container(
            color:
                _authController.isDarkMode ? AppColor.darkBlue : AppColor.white,
            height: Get.height * 0.5,
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
                    label: "Transaction",
                    color: AppColor.black,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      controller: _phoneController,
                      hint: "መለያ ቁጥር",
                      icon: Icons.account_balance_rounded),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: inputField(
                      keytype: TextInputType.number,
                      controller: _amountController,
                      hint: "የገንዘብ መጠን",
                      icon: FontAwesomeIcons.moneyBillWave),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // SizedBox(
                //   width: Get.width * 0.9,
                //   child: inputField(
                //       controller: _remarkController,
                //       hint: "Remark",
                //       icon: FontAwesomeIcons.noteSticky),
                // ),
                // SizedBox(
                //   height: Get.height * 0.05,
                // ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Obx(
                    () => _walletController.isLoading
                        ? SizedBox(
                            height: Get.height * 0.05,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ))
                        : ElevatedButton.icon(
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
                                _walletController
                                    .transferToUser(TransactionModel(
                                  amount: double.parse(_amountController.text),
                                  receiverAccount: _phoneController.text,
                                  senderAccount:
                                      _walletController.myWallet!.account,
                                ));
                              }
                              if (_walletController.isLoading) {
                                _amountController.clear();
                                _phoneController.clear();
                                Get.back();
                              }
                            },
                            label: TextWidget(
                              label: "ይላኩ",
                              size: 16,
                            ),
                            icon: const Icon(FontAwesomeIcons.dollarSign),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
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
    );
  }

  Widget _transactionList() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TextWidget(
                            label: "25199999",
                            size: 14,
                            color: AppColor.black,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          child: TextWidget(
                            label: "+20 ETB",
                            color: AppColor.black,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TextWidget(
                            label: "20/2/2022",
                            color: AppColor.darkGray,
                            size: 12,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Container(
                          child: TextWidget(
                            label: "transaction",
                            color: AppColor.black,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Widget _cards({
    required String title,
    required String data,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Card(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 1,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: TextWidget(
                        label: title,
                        size: 16,
                      ),
                    ),
                    Container(
                      child: TextWidget(
                        label: data,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.25,
              ),
              Expanded(
                child: Container(
                  child: Icon(
                    icon,
                    color: AppColor.white,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
