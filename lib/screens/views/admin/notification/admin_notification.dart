import 'dart:developer';

import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/wallet/wallet_controller.dart';
import 'package:ekub/screens/views/admin/notification/refundNotificationDetail.dart';
import 'package:ekub/screens/widgets/tab_indictor.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminNotification extends StatefulWidget {
  const AdminNotification({Key? key}) : super(key: key);

  @override
  State<AdminNotification> createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification>
    with TickerProviderStateMixin {
  final _authControler = Get.find<AuthController>();
  final _walletController = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);
    _walletController.getReqRefunds();
    log("refund" + _walletController.refundController.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Notification'),
        ),
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                child: TextWidget(
                  label: 'Today',
                  ftw: FontWeight.bold,
                  size: 25,
                ),
              ),
              Container(
                child: TextWidget(
                  label: DateTime.now().month.toString() +
                      "-" +
                      DateTime.now().day.toString() +
                      "-" +
                      DateTime.now().year.toString(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    unselectedLabelColor: _authControler.isDarkMode
                        ? AppColor.darkGray
                        : AppColor.purple,
                    labelColor: _authControler.isDarkMode
                        ? AppColor.white
                        : AppColor.primaryColor,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    indicator: CircleTabIndicator(
                        _authControler.isDarkMode
                            ? AppColor.secondaryColor
                            : AppColor.black,
                        4),
                    tabs: [
                      TextWidget(
                        label: "ዛሬ",
                        // color: AppColor.black,
                        size: 16,
                      ),
                      TextWidget(
                        label: "ወርሃዊ",
                        // color: AppColor.black,
                        size: 16,
                      ),
                      TextWidget(
                        label: "የሁልጊዜ",
                        size: 16,
                        // color: AppColor.black,
                      ),
                    ]),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.5,
                  child: TabBarView(controller: _tabController, children: [
                    Container(
                        child: ListView(
                      children: [_withdrwalList()],
                    )),
                    Container(
                        child: ListView(
                      children: const [],
                    )),
                    Container(
                        child: ListView(
                      children: const [],
                    ))
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget _withdrwalList() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AdminRefundNotificationDetail());
      },
      child: Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Container(
                  child: const CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/300")),
                ),
                title: TextWidget(label: "Amanuel Awol request refund"),
                subtitle: Container(
                    alignment: Alignment.topLeft,
                    child: TextWidget(
                      label: "2000 ETB",
                    )),
              ),
            )

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       child: ElevatedButton.icon(
            //           onPressed: () {},
            //           icon: const Icon(Icons.check),
            //           label: const Text("Accept")),
            //     ),
            //     SizedBox(
            //       height: Get.width * 0.05,
            //     ),
            //     Container(
            //       child: ElevatedButton.icon(
            //         onPressed: () {},
            //         icon: const Icon(Icons.close),
            //         label: const Text("reject"),
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(Colors.red),
            //         ),
            //       ),
            //     )
            //   ],
            // )

            ),
      ),
    );
  }
}



                // Container(
                //   child: TextWidget(label: "you received a refund request"),
                // )

              