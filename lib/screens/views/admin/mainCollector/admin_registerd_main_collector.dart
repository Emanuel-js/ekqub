import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminResistersMainCollector extends StatelessWidget {
  const AdminResistersMainCollector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authControler = Get.find<AuthController>();
    _authControler.getUserMyUsers();
    return Scaffold(
        backgroundColor: AppColor.lightGray,
        appBar: AppBar(
          backgroundColor: AppColor.lightGray,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextWidget(
                label: "User List",
                color: AppColor.black,
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
          margin: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [getUsers()],
          ),
        ));
  }

  Widget getUsers() {
    return Container(
      child: Card(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
          leading: CircleAvatar(
            backgroundColor: AppColor.secondaryColor,
            radius: 40,
            child: const CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
          ),
          title: TextWidget(
            label: "Full Name",
            color: AppColor.black,
          ),
          subtitle: TextWidget(
            label: "phone",
            color: AppColor.black,
            size: 14,
          ),
          trailing: TextWidget(
            label: "City",
            color: AppColor.black,
            size: 15,
          ),
        ),
      ),
    );
  }
}
