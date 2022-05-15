import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserDropScreen extends StatelessWidget {
  const UserDropScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
            heroTag: "transfer",
            onPressed: () {
              // transfer();
            },
            child: Icon(
              FontAwesomeIcons.vault,
              color: AppColor.white,
            ),
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
              _cards(
                  data: "10",
                  title: "Total Drop Times",
                  icon: FontAwesomeIcons.piggyBank,
                  subtite: "start date 2/10/2022"),
              _cards(
                  data: "5",
                  title: "Daily Drops",
                  icon: FontAwesomeIcons.receipt,
                  subtite: "10 ETB"),
              _cards(
                  data: "2 ETB",
                  title: "My Level",
                  icon: FontAwesomeIcons.stairs,
                  subtite: "Level 1"),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: Get.width * 0.09),
                child: TextWidget(
                  label: "My Lots Code",
                  ftw: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        width: Get.width * 0.8,
                        child: tiketCard()),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        width: Get.width * 0.8,
                        child: tiketCard()),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        width: Get.width * 0.8,
                        child: tiketCard()),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        width: Get.width * 0.8,
                        child: tiketCard()),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        width: Get.width * 0.8,
                        child: tiketCard()),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget tiketCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: AppColor.secondaryColor,
                radius: 20,
                child: Icon(
                  FontAwesomeIcons.receipt,
                  color: AppColor.white,
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.04,
            ),
            tiketNumber("1"),
            tiketNumber("8"),
            tiketNumber("3"),
            tiketNumber("3"),
            tiketNumber("9"),
            tiketNumber("6"),
            tiketNumber("2"),
            tiketNumber("1"),
          ],
        ),
      ),
    );
  }

  Widget tiketNumber(String num) {
    return Container(
      child: CircleAvatar(
        radius: 15,
        backgroundColor: AppColor.darkBlue,
        child: TextWidget(
          label: num,
          size: 14,
        ),
      ),
    );
  }

  Widget _cards(
      {required String title,
      required String data,
      required IconData icon,
      required String subtite}) {
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
                    ),
                    Container(
                      child: TextWidget(
                        label: subtite,
                        size: 12,
                        color: AppColor.lightGray,
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
