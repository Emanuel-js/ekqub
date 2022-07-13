import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/screens/views/admin/mainCollector/main_collector_detail.dart';
import 'package:ekub/screens/widgets/tab_indictor.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminResistersMainCollector extends StatefulWidget {
  const AdminResistersMainCollector({Key? key}) : super(key: key);

  @override
  State<AdminResistersMainCollector> createState() =>
      _AdminResistersMainCollectorState();
}

class _AdminResistersMainCollectorState
    extends State<AdminResistersMainCollector> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final _authControler = Get.find<AuthController>();
    _authControler.getMyUsers();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextWidget(
                label: "User List",
                // color: AppColor.black,
              ),
            )
          ],
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
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      unselectedLabelColor: AppColor.purple,
                      labelColor: AppColor.primaryColor,
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      indicator: CircleTabIndicator(AppColor.black, 4),
                      tabs: [
                        TextWidget(
                          label: "today",
                          // color: AppColor.black,
                          size: 16,
                        ),
                        TextWidget(
                          label: "month",
                          // color: AppColor.black,
                          size: 16,
                        ),
                        TextWidget(
                          label: "alltime",
                          size: 16,
                          // color: AppColor.black,
                        ),
                      ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: double.maxFinite,
                height: Get.height * 0.78,
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    child: ListView(
                      children: [
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        getUsers(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ));
  }

  Widget getUsers() {
    return GestureDetector(
      onTap: () => {Get.to(() => const AdminMainCollectorDetail())},
      child: Container(
        width: double.maxFinite,
        height: Get.height * 0.15,
        decoration: BoxDecoration(
          // color: AppTheme.darkTheme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: AppColor.secondaryColor,
                radius: 50,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextWidget(
                      // color: AppColor.black,
                      label: "First Name",
                      size: 15,
                    ),
                  ),
                  Container(
                    child: TextWidget(
                        // color: AppColor.black,
                        label: "Phone Number",
                        size: 15),
                  )
                ],
              ),
            ),
            Container(
              child: TextWidget(
                // color: AppColor.black,
                label: "7/13/2022",
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
