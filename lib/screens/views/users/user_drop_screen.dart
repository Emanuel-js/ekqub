import 'dart:developer';

import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/ticket/model/drop_ticket_model.dart';
import 'package:ekub/data/ticket/model/ticekt_model.dart';
import 'package:ekub/data/ticket/ticket_controller.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:ekub/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserDropScreen extends StatefulWidget {
  const UserDropScreen({Key? key}) : super(key: key);

  @override
  State<UserDropScreen> createState() => _UserDropScreenState();
}

class _UserDropScreenState extends State<UserDropScreen> {
  final _moneyController = TextEditingController();

  final _timesController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();
  final _ticketController = Get.find<TicketController>();
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    // _ticketController.getMyTicket(_authController.userInfo!.id.toString());

    final List<TicketModel>? allTicket = _ticketController.myLotto;
    final List<TicketModel> monday = [];
    final List<TicketModel> tuesday = [];

    void removeAll(TicketModel toRemove) {
      allTicket!.removeWhere((ticket) => ticket.id == toRemove.id);
      monday.removeWhere((ticket) => ticket.id == toRemove.id);
      tuesday.removeWhere((ticket) => ticket.id == toRemove.id);
    }

    log("monday  $monday");
    log("tuesday  $tuesday");
    log("allTicket  $allTicket");

    return Scaffold(
        floatingActionButton: Container(
          child: Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              heroTag: "transfer",
              onPressed: () {
                dropLott();
              },
              child: Icon(
                FontAwesomeIcons.vault,
                color: AppColor.white,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            alignment: Alignment.centerRight,
            child: TextWidget(
              label: "ጣል",
              size: 20,
              color: AppColor.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => _cards(
                    data: "${_ticketController.myLotto?.length}",
                    title: "ጠቅላላ የጣሉት",
                    icon: FontAwesomeIcons.piggyBank,
                    subtite: "start date 2/10/2022"),
              ),
              Obx(
                () => _cards(
                    data: "${_ticketController.myLotto?.length}",
                    title: "ዕለታዊ እጣ",
                    icon: FontAwesomeIcons.receipt,
                    subtite: "10 ETB"),
              ),
              // _cards(
              //     data: "5s ETB",
              //     title: "My Level",
              //     icon: FontAwesomeIcons.stairs,
              //     subtite: "Level 1"),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: Get.width * 0.09),
                child: TextWidget(
                  label: "የእኔ ዕጣዎች",
                  ftw: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
              buildTarget(
                context,
                text: "my lotto",
                tickets: allTicket!,
                onAccept: (data) => setState(() {
                  removeAll(data);
                  allTicket.add(data);
                }),
              ),

              Container(
                child: Column(
                  children: [
                    buildTarget(context,
                        text: "Monday",
                        tickets: monday,
                        onAccept: (data) => setState(() {
                              removeAll(data);
                              monday.add(data);
                            })),
                    buildTarget(context,
                        text: "Tuesday",
                        tickets: tuesday,
                        onAccept: (data) => setState(() {
                              removeAll(data);
                              tuesday.add(data);
                            })),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget tiketCard(TicketModel loto) {
    var i = loto.ticketNumber;
    var mylot = i.toString().split('');

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: AppColor.secondaryColor,
                radius: 20,
                child: TextWidget(label: "${loto.amount}"),
              ),
            ),
            SizedBox(
              width: Get.width * 0.04,
            ),
            ...mylot.map((lo) => tiketNumber(lo.toString())).toList(),
          ],
        ),
      ),
    );
  }

  Widget tiketNumber(String num) {
    return Container(
      child: CircleAvatar(
        radius: 15,
        backgroundColor: AppColor.darkBlue,
        child: TextWidget(
          label: num,
          size: 14,
        ),
      ),
    );
  }

  Widget _cards(
      {required String title,
      required String data,
      required IconData icon,
      required String subtite}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Card(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
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
                    ),
                    Container(
                      child: TextWidget(
                        label: subtite,
                        size: 12,
                        color: AppColor.lightGray,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.25,
              ),
              Container(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.secondaryColor,
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

  Widget moneyDrop({bool isSlected = false, required String title}) {
    return ChoiceChip(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      label: TextWidget(label: title),
      selectedColor: AppColor.secondaryColor,
      selected: isSlected,
      backgroundColor: AppColor.primaryColor,
    );
  }

  dropLott() {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: _authController.isDarkMode
              ? AppTheme.darkTheme.backgroundColor
              : AppTheme.lightTheme.backgroundColor,
        ),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                width: 120,
                height: 15,
                decoration: BoxDecoration(
                    color: AppColor.lightGray,
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SizedBox(
                width: Get.width * 0.8,
                child: inputField(
                    controller: _moneyController,
                    hint: "የገንዘብ መጠን",
                    keytype: TextInputType.number),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SizedBox(
                width: Get.width * 0.8,
                child: inputField(
                    controller: _timesController,
                    hint: "የትኬት መጠን",
                    keytype: TextInputType.number),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: Get.height * 0.01, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _ticketController.dropTicket(DropTicketModel(
                          amount: double.parse(_moneyController.text),
                          numberOfTickets: int.parse(_timesController.text),
                          userId: int.parse(
                              _authController.userInfo!.id.toString())));
                      if (_ticketController.isLoading) {
                        Get.back();
                      }
                    }
                  },
                  label: TextWidget(
                    label: "ጣል",
                    size: 16,
                  ),
                  icon: const Icon(FontAwesomeIcons.piggyBank),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget inputField(
      {required String hint,
      required TextEditingController controller,
      IconData? icon,
      TextInputType keytype = TextInputType.text}) {
    return TextFormField(
      style: const TextStyle(fontSize: 16),
      controller: controller,
      keyboardType: keytype,
      validator: (v) {
        if (v!.isEmpty) {
          return "Please insret required filed";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Container(
            padding: const EdgeInsets.only(left: 10), child: Icon(icon)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        labelText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
    );
  }

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<TicketModel> tickets,
    required DragTargetAccept<TicketModel> onAccept,
  }) =>
      Column(children: [
        Container(
          child: TextWidget(
            label: text,
            size: 16,
          ),
        ),
        DragTarget<TicketModel>(
            onWillAccept: (data) => true,
            onAccept: (data) {
              onAccept(data);
            },
            builder: (context, candidateData, rejectedData) => Column(
                  children: [
                    ...tickets
                        .map((lot) => DragbleWidget(ticketModel: lot))
                        .toList(),
                    IgnorePointer(child: Container()),
                  ],
                )),
      ]);

  Widget DragbleWidget({required TicketModel ticketModel}) {
    return Draggable<TicketModel>(
      data: ticketModel,
      child: tiketCard(ticketModel),
      feedback: tiketCard(ticketModel),
      childWhenDragging: Container(
        width: Get.width,
      ),
    );
  }
}
