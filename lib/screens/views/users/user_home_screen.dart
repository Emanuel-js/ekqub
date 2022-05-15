import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ekub/screens/views/users/user_loting_screen.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    // callback function
    Get.to(UserLotScreen());
  }

  @override
  Widget build(BuildContext context) {
    scheduleTimeout(5 * 1000);
    return Scaffold(
      backgroundColor: AppColor.lightGray,
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [profile(), timeCard()],
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Container(child: banner()),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: Get.height * 0.02,
              crossAxisSpacing: Get.width * 0.02,
              children: [
                card(
                    data: "5",
                    icon: FontAwesomeIcons.receipt,
                    subtitle: "lotto number you have",
                    title: "Total Lots",
                    color: AppColor.lightBlue),
                card(
                    data: "100 ETB",
                    icon: FontAwesomeIcons.wallet,
                    subtitle: "wallet account remaining",
                    title: "Total Wallet",
                    color: AppColor.primaryColor),
                card(
                  data: "20 ETB",
                  icon: FontAwesomeIcons.moneyBills,
                  subtitle: "saving account balance",
                  title: "Saving Amount",
                  color: AppColor.darkGray,
                ),
                card(
                    data: "5",
                    icon: FontAwesomeIcons.piggyBank,
                    subtitle: "total times you drop",
                    title: "Total Drop",
                    color: AppColor.purple),
              ],
            ),
          )
        ],
      ),
    );
  }

//todo header part
  Widget profile() {
    return Container(
      child: CircleAvatar(
        backgroundColor: AppColor.secondaryColor,
        radius: 40,
        child: Container(
          child: const CircleAvatar(
            radius: 34,
            backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
          ),
        ),
      ),
    );
  }

  Widget timeCard() {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          color: AppColor.primaryColor,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: Get.height * .03, horizontal: 20),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColor.secondaryColor,
                    child: Icon(
                      Icons.timer,
                      color: AppColor.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextWidget(
                          label: "Today lots",
                          color: AppColor.white,
                          ftw: FontWeight.w600,
                        ),
                      ),
                      Container(
                        child: TextWidget(
                          label: "Remaining Time 3:00h",
                          color: AppColor.white,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

//todo slide
  Widget banner() {
    return CarouselSlider(
      options: CarouselOptions(height: Get.height * 0.2),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  color: AppColor.darkBlue,
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Get.width * 0.02,
                        horizontal: Get.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: TextWidget(
                            label: "Today Winner",
                            color: AppColor.white,
                          ),
                        ),
                        Container(
                          child: TextWidget(
                            label: "23413243",
                            lts: 3,
                            size: 30,
                            ftw: FontWeight.w600,
                            color: AppColor.white,
                          ),
                        ),
                        Container(
                          child: TextWidget(
                            label: "1,000,000 ETB",
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .2,
                    child: Image.asset("assets/imgs/tro.png"),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget card(
      {required String title,
      required String data,
      required IconData icon,
      required Color color,
      required String subtitle}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: Get.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Container(
              child: TextWidget(
                label: title,
                size: 18,
                ftw: FontWeight.w600,
              ),
            ), //subtitle
            Container(
              child: Row(
                children: [
                  Container(
                    child: TextWidget(
                      label: data,
                      ftw: FontWeight.w200,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Icon(
                    icon,
                    color: AppColor.white,
                    size: 25,
                  )
                ],
              ),
            ),
            Container(
              child: TextWidget(
                label: subtitle,
                size: 12,
              ),
            )
            //sub
          ],
        ),
      ),
    );
  }
}