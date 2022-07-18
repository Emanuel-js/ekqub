import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authControler = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                // profile
                Container(
                  child: TextWidget(label: "Profile"),
                ),

                //settings
                Container(
                  child: IconButton(
                      icon: const Icon(Icons.settings), onPressed: () {}),
                )
              ],
            ),
            //image
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.06),
              child: Hero(
                tag: "profile",
                child: Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColor.secondaryColor,
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/300"),
                    ),
                  ),
                ),
              ),
            ),
            //name
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextWidget(
                  size: 25,
                  label: _authControler.userInfo!.username.toString()),
            ),
            //phone
            Container(
              child: TextWidget(
                  size: 20, label: _authControler.userInfo!.email.toString()),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),

            SizedBox(
              height: Get.height * 0.05,
            ),
            // language
            Container(
              child: ListTile(
                leading: const Icon(Icons.language),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "Language"),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            ),

            //
            // theme
            Container(
              child: ListTile(
                leading: Container(
                  child: Obx(
                    () => Container(
                      child: _authControler.isDarkMode
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.light_mode),
                    ),
                  ),
                ),
                title: Container(
                  alignment: Alignment.topLeft,
                  child: TextWidget(label: "Theme"),
                ),
                trailing: Obx(
                  () => Switch(
                    activeColor: AppColor.secondaryColor,
                    value: _authControler.isDarkMode,
                    onChanged: (value) {
                      _authControler.isDarkMode = value;
                    },
                  ),
                ),
              ),
            ),
            // // about us
            Container(
              child: ListTile(
                leading: const Icon(Icons.info),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "About us"),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            ),
            // contact us
            Container(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "Contact us"),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                ),
              ),
            ),

            Container(
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(label: "Logout"),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    _authControler.logOut();
                  },
                ),
              ),
            ),
            // logout
          ],
        ),
      )),
    );
  }
}
