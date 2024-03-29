import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/screens/views/admin/mainCollector/admin_registerd_main_collector.dart';
import 'package:ekub/screens/views/admin/notification/admin_notification.dart';
import 'package:ekub/screens/views/admin/profile.dart';
import 'package:ekub/screens/views/admin/register_main_collector.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to exit an App'),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(false), //<-- SEE HERE
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(true), // <-- SEE HERE
                  child: const Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    final _autController = Get.find<AuthController>();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.darkBlue,
            child: Icon(
              Icons.add,
              color: AppColor.white,
            ),
            onPressed: () {
              Get.to(() => const RegisterMainCollector());
            }),
        body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.33,
                child: AppBar(
                  leading: Container(),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                  backgroundColor: AppColor.darkBlue,
                  elevation: 0,
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications_active,
                        ),
                        onPressed: () {
                          Get.to(() => const AdminNotification());
                        },
                      ),
                    ),
                    Hero(
                      tag: "profile",
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const AdminProfile());
                        },
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: AppColor.secondaryColor,
                            radius: 40,
                            child: Container(
                              child: const CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    NetworkImage("https://i.pravatar.cc/300"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextWidget(
                          label: "እንኳን ደህና መጡ",
                          // color: AppColor.white,
                          ftw: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      TextWidget(
                        label: _autController.userInfo!.username.toString(),
                        // color: AppColor.white,
                        ftw: FontWeight.bold,
                        size: 30,
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: Get.height * 0.23),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: Get.height * 0.02,
                  crossAxisSpacing: Get.width * 0.02,
                  children: [
                    _cards(
                        onPressed: () {},
                        data: "1M",
                        icon: FontAwesomeIcons.receipt,
                        subtitle: "አጠቃላይ እቁብ ጣይዮች ብዛት",
                        title: "እቁብ ጣይዮች",
                        color: AppColor.lightBlue),
                    _cards(
                        onPressed: () {
                          Get.to(() => const AdminResistersMainCollector());
                        },
                        data: "5",
                        icon: FontAwesomeIcons.userGroup,
                        subtitle: "የሰብሳቢዎች ጠቅላላ ቁጥር",
                        title: "የዋና ሰብሳቢዎች",
                        color: AppColor.darkGray),
                    _cards(
                        onPressed: () {},
                        data: "100",
                        icon: FontAwesomeIcons.personCirclePlus,
                        subtitle: "የሽያጭ ሠራተኞች ጠቅላላ ቁጥር",
                        title: "ሽያጭ ሠራተኞች",
                        color: AppColor.darkGray),
                    _cards(
                        onPressed: () {},
                        data: "10M ብር",
                        icon: FontAwesomeIcons.moneyBill,
                        subtitle: "ጠቅላላ የተቀመጠ ገንዘብ",
                        title: "የተቀመጠ ገንዘብ",
                        color: AppColor.lightBlue),
                    _cards(
                        onPressed: () {},
                        data: "5",
                        icon: FontAwesomeIcons.moneyCheck,
                        subtitle: "እቁብ የወጣለት ብዛት",
                        title: "እቁብ የደረሰው",
                        color: AppColor.lightBlue),
                    _cards(
                        onPressed: () {},
                        data: "5",
                        icon: FontAwesomeIcons.personWalking,
                        subtitle: "አቆርጦ የወጣ እቁብ ጣይ",
                        title: "አቆርጦ የወጣ",
                        color: AppColor.darkGray),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cards(
      {required String title,
      required String data,
      required IconData icon,
      required Color color,
      required Function onPressed,
      required String subtitle}) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
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
                  size: 11,
                ),
              )
              //sub
            ],
          ),
        ),
      ),
    );
  }
}
