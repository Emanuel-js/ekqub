import 'package:ekub/data/wallet/model/refend_model.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:ekub/utils/formating.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdminRefundNotificationDetail extends StatelessWidget {
  const AdminRefundNotificationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefundModel refund = Get.arguments;
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
                          label: refund.fullName,
                          ftw: FontWeight.bold,
                          size: 25,
                        ),
                      ),
                      Hero(
                        tag: refund.updatedAt.toString(),
                        child: Container(
                          child: const CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage("https://i.pravatar.cc/300")),
                        ),
                      )
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
                        data: refund.bankName.toString(),
                        title: "Bank Name",
                        icon: FontAwesomeIcons.bank),
                  ),
                  Container(
                    child: _card(
                        data: refund.bankAccountNumber.toString(),
                        title: "Account Number",
                        lts: 2,
                        icon: FontAwesomeIcons.bank),
                  ),
                  Container(
                    child: _card(
                        data: refund.phoneForBankAccountNumber.toString(),
                        title: "Phone Number",
                        lts: 2,
                        icon: FontAwesomeIcons.phone),
                  ),
                  Container(
                    child: _card(
                        data:
                            Formatting.formatDate(refund.createdAt.toString()),
                        title: "Refund Date",
                        icon: Icons.date_range),
                  ),

                  Container(
                    child: _card(
                        data: refund.reason.toString(),
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
                      label: "10,000 ብር",
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
                      label: "200 ብር",
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
                            onPressed: () {},
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
