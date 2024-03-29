import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/wallet/wallet_controller.dart';
import 'package:ekub/screens/views/subcollectors/profile_screen.dart';
import 'package:ekub/screens/views/subcollectors/registerr/register_lotter_screen.dart';
import 'package:ekub/screens/views/subcollectors/subcollector_lotter_screen.dart';
import 'package:ekub/screens/views/subcollectors/subcollector_wallet_screen.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SubCollectorHomeScreen extends StatelessWidget {
  const SubCollectorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    final _walletController = Get.find<WalletController>();
    _walletController.getWalletAccount(_authController.userInfo!.id.toString());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            Icons.add,
            color: AppColor.white,
          ),
          onPressed: () {
            Get.to(() => const RegisterLottScreen());
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
                      onPressed: () {},
                    ),
                  ),
                  Hero(
                    tag: "profile",
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const SubCollectorProfile());
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
                        color: AppColor.white,
                        ftw: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    TextWidget(
                      label: _authController.userInfo!.username.toString(),
                      color: AppColor.white,
                      ftw: FontWeight.bold,
                      size: 30,
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: Get.height * 0.23),
              child: Column(
                children: [
                  _cards(
                      data: "100",
                      icon: FontAwesomeIcons.peopleGroup,
                      title: "ጠቅላላ ዕጣ",
                      onPress: () {
                        Get.to(SubCollectorLottScreen());
                      }),
                  Obx(
                    () => _cards(
                        data: "${_walletController.myWallet!.balance} ETB",
                        icon: FontAwesomeIcons.wallet,
                        title: "ጠቅላላ ተቀማጭ",
                        onPress: () {
                          Get.to(const SubCollectorWalletScreen());
                        }),
                  ),
                  _cards(
                      data: "20K ETB",
                      icon: FontAwesomeIcons.moneyBill,
                      title: "Total Earning",
                      onPress: () {
                        Get.to(() => const SubCollectorProfile());
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cards(
      {required String title,
      required String data,
      required IconData icon,
      required Function onPress}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          onPress();
        },
        child: Card(
          color: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(40),
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
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColor.secondaryColor,
                      child: Icon(
                        icon,
                        color: AppColor.white,
                        size: 40,
                      ),
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
      ),
    );
  }
}
