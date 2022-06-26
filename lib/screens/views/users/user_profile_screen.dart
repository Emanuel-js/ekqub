import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Center(
          child: Stack(children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.only(top: Get.height * 0.1),
              color: AppColor.primaryColor,
              child: SizedBox(
                width: Get.width * 0.9,
                height: Get.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            label: "Saving Balance ",
                            ftw: FontWeight.w600,
                          ),
                          TextWidget(label: "200 ETB"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                            label: "My Wallet",
                            ftw: FontWeight.w600,
                          ),
                          TextWidget(label: "300 ETB"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                            label: "Total dorp",
                            ftw: FontWeight.w600,
                          ),
                          TextWidget(label: "10 Times"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                            label: "My Level",
                            ftw: FontWeight.w600,
                          ),
                          TextWidget(label: "2 ETB"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                            label: "Total dorp",
                            ftw: FontWeight.w600,
                          ),
                          TextWidget(label: "10 Times"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Hero(
              tag: "profile",
              child: Container(
                margin: EdgeInsets.only(
                    bottom: Get.height * 0.05, left: Get.width * 0.2),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: AppColor.secondaryColor,
                  child: const CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
