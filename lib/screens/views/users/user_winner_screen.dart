import 'package:ekub/screens/views/users/user_main_screen.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UserWinnerScreen extends StatefulWidget {
  const UserWinnerScreen({Key? key}) : super(key: key);

  @override
  State<UserWinnerScreen> createState() => _UserWinnerScreenState();
}

class _UserWinnerScreenState extends State<UserWinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.darkBlue, AppColor.primaryColor],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TextWidget(
                label: "Congratulations",
                size: 36,
                ftw: FontWeight.w600,
              ),
            ),
            Container(
              child: Lottie.asset("assets/imgs/no1.json"),
            ),
            Container(
              child: TextWidget(
                label: "You Win 1,000,000  ETB",
                size: 20,
              ),
            ),
            SizedBox(
              width: Get.width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.secondaryColor),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  //todo
                  Get.to(const UserMainScreen());
                },
                child: TextWidget(
                  label: "Continue",
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
