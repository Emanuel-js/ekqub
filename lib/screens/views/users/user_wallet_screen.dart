import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserWalletScreen extends StatelessWidget {
  UserWalletScreen({Key? key}) : super(key: key);
  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();
  final _remarkController = TextEditingController();
  final _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "transfer",
          onPressed: () {
            transfer();
          },
          child: Icon(
            FontAwesomeIcons.moneyBillTransfer,
            color: AppColor.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.lightGray,
          elevation: 0,
          title: Container(
            alignment: Alignment.centerRight,
            child: TextWidget(
              label: "Wallet",
              size: 20,
              color: AppColor.black,
            ),
          ),
        ),
        backgroundColor: AppColor.lightGray,
        body: Container(
          child: Column(
            children: [
              //cards
              _cards(
                  data: "100 ETB",
                  icon: FontAwesomeIcons.wallet,
                  title: "Wallet Balance"),

              _cards(
                  data: "200 ETB",
                  icon: FontAwesomeIcons.moneyBills,
                  title: "Saving Account"),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: TextWidget(
                        label: "Transaction History",
                        color: AppColor.black,
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {},
                      label: TextWidget(
                        label: "charge",
                        size: 16,
                      ),
                      icon: const Icon(FontAwesomeIcons.dollarSign),
                    )
                  ],
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
                    _transactionList(),
                    _transactionList(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  transfer() {
    Get.bottomSheet(SingleChildScrollView(
      child: Form(
        key: _globalKey,
        child: Container(
          color: AppColor.white,
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
                    hint: "Phone",
                    keytype: TextInputType.phone,
                    icon: FontAwesomeIcons.phone),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: inputField(
                    controller: _amountController,
                    hint: "Amount",
                    icon: FontAwesomeIcons.moneyBillWave),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: inputField(
                    controller: _remarkController,
                    hint: "Remark",
                    icon: FontAwesomeIcons.noteSticky),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: Get.height * 0.01, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  onPressed: () {
                    Get.snackbar("Transaction",
                        "Your Transaction to ${_phoneController.text} is done");
                  },
                  label: TextWidget(
                    label: "Send",
                    size: 16,
                  ),
                  icon: const Icon(FontAwesomeIcons.dollarSign),
                ),
              )
            ],
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

  Widget _cards(
      {required String title, required String data, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Card(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
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
              Container(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.secondaryColor,
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
