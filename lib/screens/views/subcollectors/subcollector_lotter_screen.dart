import 'package:ekub/screens/views/subcollectors/registerr/register_lotter_screen.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SubCollectorLottScreen extends StatelessWidget {
  const SubCollectorLottScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: "regsiter",
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            FontAwesomeIcons.plus,
            color: AppColor.white,
          ),
          onPressed: () {
            Get.to(const RegisterLottScreen());
          }),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.darkBlue,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    )),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.33,
                child: AppBar(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  )),
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
                  backgroundColor: AppColor.darkBlue,
                  elevation: 0,
                  actions: [
                    Container(
                        margin: const EdgeInsets.only(right: 20, top: 20),
                        child: TextWidget(label: "Lotter"))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: Get.height * 0.23),
                child: Column(
                  children: [
                    _cards(
                        title: "Total Lotter",
                        data: "50",
                        icon: FontAwesomeIcons.peopleGroup),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20, top: 10),
            child: TextWidget(
              label: "My Lotter",
              color: AppColor.black,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _lotterList(),
                _lotterList(),
                _lotterList(),
                _lotterList(),
                _lotterList()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _lotterList() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Card(
            color: AppColor.lightBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                  )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TextWidget(
                            label: "Mr .xyz",
                            size: 14,
                            color: AppColor.black,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          child: TextWidget(
                            label: "+20 ETB",
                            color: AppColor.black,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Container(
                    child: TextWidget(
                      label: "20/2/2022",
                      color: AppColor.darkGray,
                      size: 12,
                    ),
                  )
                ],
              ),
            )));
  }

  Widget _cards({
    required String title,
    required String data,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Card(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.all(50),
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
                  child: Icon(
                    icon,
                    color: AppColor.white,
                    size: 40,
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
    );
  }
}
