import 'dart:developer';

import 'package:ekub/data/wallet/model/refend_model.dart';
import 'package:ekub/data/wallet/model/refund_requst_approved_model.dart';
import 'package:ekub/data/wallet/wallet_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:ekub/utils/formating.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdminRefundNotificationDetail extends StatelessWidget {
  AdminRefundNotificationDetail({Key? key}) : super(key: key);
  final _walletController = Get.find<WalletController>();
  RefundModel refund = Get.arguments;
  @override
  Widget build(BuildContext context) {
    log(refund.toMap().toString());
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  // full anme
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          label: refund.refundForm!.fullName.toString(),
                          ftw: FontWeight.bold,
                          size: 25,
                        ),
                      ),
                      Hero(
                          tag: refund.refundForm!.updatedAt.toString() +
                              refund.refundForm!.reason.toString(),
                          child: Container(
                              child: const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200"))))
                    ],
                  ),
                  // account balance
                  Container(
                    child: banner(),
                  ),
                  // refund balance
                  // refund date
                  Container(
                    child: _card(
                        data: refund.refundForm!.bankName.toString(),
                        title: "Bank Name",
                        icon: FontAwesomeIcons.bank),
                  ),
                  Container(
                    child: _card(
                        data: refund.refundForm!.bankAccountNumber.toString(),
                        title: "Account Number",
                        lts: 2,
                        icon: FontAwesomeIcons.bank),
                  ),
                  Container(
                    child: _card(
                        data: refund.refundForm!.phoneForBankAccountNumber
                            .toString(),
                        title: "Phone Number",
                        lts: 2,
                        icon: FontAwesomeIcons.phone),
                  ),
                  Container(
                    child: _card(
                        data: Formatting.formatDate(
                            refund.refundForm!.createdAt.toString()),
                        title: "Refund Date",
                        icon: Icons.date_range),
                  ),

                  Container(
                    child: _card(
                        data: refund.refundForm!.reason.toString(),
                        title: "Reason",
                        icon: FontAwesomeIcons.noteSticky),
                  ),

                  // refund reason
                  // refund status
                  // user details
                  // accept and rejuect button
                ],
              ),
            )));
  }

  Widget _card(
      {required String title,
      required String data,
      required IconData icon,
      double? lts}) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Container(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            label: title,
            ftw: FontWeight.w300,
          ),
        ),
        subtitle: Container(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            label: data,
            lts: lts,
          ),
        ),
      ),
    );
  }

  Widget banner() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.darkBlue, borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: Get.width * 0.02, horizontal: Get.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: TextWidget(
                      label: "ጠቅላላ ቁጠባ መጠን",
                    ),
                  ),
                  Container(
                    child: TextWidget(
                      label: refund.wallet!.balance.toString() + " " + "ETB".tr,
                      size: 30,
                      ftw: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextWidget(
                      label: "ተመላሽ ገንዘብ",
                      color: AppColor.white,
                    ),
                  ),
                  Container(
                    child: TextWidget(
                      label:
                          refund.refundForm!.amount.toString() + " " + "ETB".tr,
                      color: AppColor.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.green[500],
                              ),
                            ),
                            onPressed: () {
                              _walletController.requestRefundApproval(
                                  RefundRequestApprovedModel(
                                userId: refund.refundForm!.userId,
                                refundMeStatus: "APPROVE",
                                refundUniqueId: refund.wallet!.account,
                              ));
                            },
                            icon: const Icon(Icons.check),
                            label: TextWidget(label: "Approve")),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Container(
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.red[500],
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.close),
                            label: TextWidget(label: "Decline")),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
