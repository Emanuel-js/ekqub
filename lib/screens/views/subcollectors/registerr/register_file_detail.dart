import 'package:ekub/data/subcollector/sub_collector_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:ekub/utils/file_upload.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LotterFileUpload extends StatefulWidget {
  const LotterFileUpload({Key? key}) : super(key: key);

  @override
  State<LotterFileUpload> createState() => _LotterFileUploadState();
}

class _LotterFileUploadState extends State<LotterFileUpload> {
  final _globalKey = GlobalKey<FormState>();
  final _mainCollectorController = Get.find<SubCollectorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _globalKey,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30, bottom: 30),
              child: TextWidget(
                label: "አዲስ ቆጣቢ ይመዝገቡ",
                color: AppColor.black,
                ftw: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Obx(() => _mainCollectorController.imageFile != null
                ? getFile()
                : Container()),
            SizedBox(
              height: Get.height * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: Container(
                child: ElevatedButton.icon(
                  icon: Icon(
                    FontAwesomeIcons.idCard,
                    color: AppColor.darkGray,
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColor.darkGray),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () async {
                    {
                      _mainCollectorController.imageFile =
                          await FileUpload().getSingleFile();
                    }
                  },
                  label: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 10),
                    child: Obx(() => TextWidget(
                          label: _mainCollectorController.imageFile != null
                              ? "መታወቂያ ካርድ ተመርጧል"
                              : "መታወቂያ አስገቡ",
                          color: AppColor.darkGray,
                          txa: TextAlign.start,
                          size: 16,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              child: Obx(() => _mainCollectorController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColor.secondaryColor,
                            child: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: Get.height * 0.02),
                          width: Get.width * 0.5,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColor.darkBlue),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)))),
                            onPressed: () {
                              if (_mainCollectorController.imageFile != null) {
                                _mainCollectorController.registerClient(
                                  _mainCollectorController.mainCollectorReq!,
                                  _mainCollectorController.imageFile,
                                );

                                if (_mainCollectorController.isRegisterd) {
                                  _mainCollectorController.imageFile = null;
                                  _mainCollectorController.lat = null;
                                  _mainCollectorController.log = null;
                                }
                              } else {
                                Get.snackbar(
                                  "ስህተት",
                                  "መታወቂያ አስገቡ",
                                  backgroundColor: AppColor.darkBlue,
                                  colorText: AppColor.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: const Duration(seconds: 2),
                                );
                              }
                            },
                            child: TextWidget(
                              label: "መዝገብ",
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    )),
            )
          ],
        ),
      ),
    ));
  }

  Widget getFile() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.darkBlue,
          width: 1,
        ),
      ),
      width: Get.width * 0.9,
      height: Get.height * 0.4,
      child: Obx(() => Image.file(
            _mainCollectorController.imageFile!,
            fit: BoxFit.cover,
          )),
    );
  }
}
