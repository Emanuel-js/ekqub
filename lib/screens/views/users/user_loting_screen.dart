import 'dart:async';
import 'dart:math';

import 'package:ekub/screens/views/users/user_winner_screen.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserLotScreen extends StatefulWidget {
  const UserLotScreen({Key? key}) : super(key: key);

  @override
  State<UserLotScreen> createState() => _UserLotScreenState();
}

class _UserLotScreenState extends State<UserLotScreen> {
  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  bool isme = false;
  final StreamController<int> _wheelConroller = StreamController<int>();
  void handleTimeout() {
    isme = true;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isme = !isme;
    });

    ///whatever you want to run on page build
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGray,
      appBar: AppBar(
        backgroundColor: AppColor.lightGray,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: const CircleAvatar(
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            isme ? winnerbanner() : banner(),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: Get.width * 0.05, top: 10),
              child: TextWidget(
                label: "Piking Code",
                color: AppColor.black,
                ftw: FontWeight.w600,
              ),
            ),
            lottNumbers(),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: Get.width * 0.04),
              child: TextWidget(
                label: "My Lots Code",
                color: AppColor.black,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: tiketCard()),
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: tiketCard()),
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: tiketCard()),
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: tiketCard()),
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: tiketCard()),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget lottNumbers() {
    return Container(
      height: Get.height * 0.25,
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: AppColor.primaryColor,
              child: Center(
                  child: TextWidget(
                label: '$index',
                size: 30,
              )),
            );
          }),
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

  Widget winnerbanner() {
    return Container(
      height: Get.height * 0.2,
      decoration: BoxDecoration(
          color: AppColor.darkBlue, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: Get.width * 0.02, horizontal: Get.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextWidget(
                    label: "Today you are the picker",
                    color: AppColor.white,
                    ftw: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextWidget(
                    label: "Pick Your Lucky Number",
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.secondaryColor)),
              child: TextWidget(
                label: "Pick",
                size: 16,
              ),
              onPressed: () {
                openWheel();
              },
            ),
          )
        ],
      ),
    );
  }

// _wheelConroller

  Widget wheel(randomNumber) {
    return SizedBox(
      width: Get.width * 0.7,
      height: Get.height * 0.3,
      child: FortuneWheel(
        physics: CircularPanPhysics(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceIn,
        ),
        selected: Stream.value(randomNumber),
        indicators: <FortuneIndicator>[
          FortuneIndicator(
            alignment: Alignment.topCenter,
            child: TriangleIndicator(
              color: AppColor.secondaryColor,
            ),
          ),
        ],
        items: [
          FortuneItem(child: TextWidget(label: "0")),
          FortuneItem(child: TextWidget(label: "1")),
          FortuneItem(child: TextWidget(label: "2")),
          FortuneItem(child: TextWidget(label: "3")),
          FortuneItem(child: TextWidget(label: "4")),
          FortuneItem(child: TextWidget(label: "5")),
          FortuneItem(child: TextWidget(label: "6")),
          FortuneItem(child: TextWidget(label: "7")),
          FortuneItem(child: TextWidget(label: "8")),
          FortuneItem(child: TextWidget(label: "9")),
        ],
      ),
    );
  }

  openWheel() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    Get.bottomSheet(
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: AppColor.white,
          ),
          height: Get.height * 0.7,
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Container(
                  width: 50,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.lightGray),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  child: TextWidget(
                    label: "Pick your lucky number ",
                    color: AppColor.black,
                  ),
                ),
                Container(
                  child: TextWidget(
                    label: "You have 2 chance",
                    color: AppColor.black,
                    size: 14,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                wheel(randomNumber),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 5,
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: TextWidget(
                                      label: "Selected Number",
                                      color: AppColor.black,
                                      size: 16,
                                    ),
                                  ),
                                  Container(
                                    child: TextWidget(
                                      label: "$randomNumber",
                                      size: 14,
                                      color: AppColor.black,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: TextWidget(
                                      label: "1",
                                      color: AppColor.black,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {
                      //todo
                      Get.to(const UserWinnerScreen());
                    },
                    child: TextWidget(
                      label: "Wheel",
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        enableDrag: true,
        isScrollControlled: true);
  }

  Widget banner() {
    return Container(
      height: Get.height * 0.2,
      decoration: BoxDecoration(
          color: AppColor.darkBlue, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width * .25,
            child: Image.asset("assets/imgs/gold.png"),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: Get.width * 0.02, horizontal: Get.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextWidget(
                    label: "Winner",
                    color: AppColor.white,
                    ftw: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: TextWidget(
                        label: "Lot Code ",
                        size: 18,
                        // ftw: FontWeight.w600,
                        color: AppColor.white,
                      ),
                    ),
                    Container(
                      child: TextWidget(
                        label: "  23413243",
                        size: 18,
                        lts: 2,
                        color: AppColor.white,
                      ),
                    )
                  ],
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
        ],
      ),
    );
  }
}
