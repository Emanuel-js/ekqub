import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/user/model/user_detail_model.dart';
import 'package:ekub/screens/views/admin/mainCollector/main_collector_detail.dart';
import 'package:ekub/screens/widgets/tab_indictor.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:ekub/theme/app_theme.dart';
import 'package:ekub/utils/formating.dart';
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
  final _authControler = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    _authControler.getMyUsers();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextWidget(
                label: "የተመዝጋቢ ዝርዝር",
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
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        unselectedLabelColor: _authControler.isDarkMode
                            ? AppColor.darkGray
                            : AppColor.purple,
                        labelColor: _authControler.isDarkMode
                            ? AppColor.white
                            : AppColor.primaryColor,
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: double.maxFinite,
                  height: Get.height * 0.78,
                  child: TabBarView(controller: _tabController, children: [
                    Obx(
                      () => ListView.builder(
                          itemCount: _authControler.userDetail!.length,
                          itemBuilder: ((context, index) {
                            UserDetailModel myUser =
                                _authControler.userDetail![index];

                            return getUsers(userDetailModel: myUser);
                          })),
                    ),
                    Container(
                      child: ListView(
                        children: const [],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: const [],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }

  Widget getUsers({
    required UserDetailModel userDetailModel,
  }) {
    return GestureDetector(
      onTap: () => {
        Get.to(() => const AdminMainCollectorDetail(),
            arguments: userDetailModel)
      },
      child: Container(
        width: double.maxFinite,
        height: Get.height * 0.15,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: _authControler.isDarkMode
              ? AppTheme.darkTheme.primaryColor
              : AppTheme.lightTheme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: userDetailModel.id.toString(),
              child: Container(
                child: CircleAvatar(
                  backgroundColor: AppColor.secondaryColor,
                  radius: 35,
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  ),
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
                      label: userDetailModel.userProfile!.firstName.toString() +
                          userDetailModel.userProfile!.lastName.toString(),
                      size: 15,
                    ),
                  ),
                  Container(
                    child: TextWidget(
                        // color: AppColor.black,
                        label:
                            userDetailModel.userProfile!.phoneNumber.toString(),
                        size: 15),
                  )
                ],
              ),
            ),
            Container(
              child: TextWidget(
                // color: AppColor.black,
                label:
                    Formatting.formatDate(userDetailModel.createdAt.toString()),
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
