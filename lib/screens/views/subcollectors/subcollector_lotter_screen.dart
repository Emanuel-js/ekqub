import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/subcollector/sub_collector_controller.dart';
import 'package:ekub/data/ticket/model/drop_ticket_model.dart';
import 'package:ekub/data/ticket/ticket_controller.dart';
import 'package:ekub/data/user/model/user_detail_model.dart';
import 'package:ekub/screens/views/subcollectors/registerr/register_lotter_screen.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:ekub/theme/app_theme.dart';
import 'package:ekub/utils/formating.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SubCollectorLottScreen extends StatefulWidget {
  const SubCollectorLottScreen({Key? key}) : super(key: key);

  @override
  State<SubCollectorLottScreen> createState() => _SubCollectorLottScreenState();
}

class _SubCollectorLottScreenState extends State<SubCollectorLottScreen> {
  final _authControler = Get.find<AuthController>();
  final _subController = Get.find<SubCollectorController>();
  final _moneyController = TextEditingController();

  final _timesController = TextEditingController();
  final _searchController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  final _ticketController = Get.find<TicketController>();
  final _authController = Get.find<AuthController>();
  int userId = 0;
  @override
  Widget build(BuildContext context) {
    _authControler.getMyUsers();
    return Scaffold(
      backgroundColor: _authControler.isDarkMode
          ? AppTheme.darkTheme.backgroundColor
          : AppColor.lightGray,
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
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
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
                        child: TextWidget(label: "ዕጣ ጣይ"))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: Get.height * 0.23),
                child: Column(
                  children: [
                    Obx(
                      () => _cards(
                          title: "ጠቅላላ ዕጣ ጣይ",
                          data: _authControler.userDetail!.length.toString(),
                          icon: FontAwesomeIcons.peopleGroup),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20, top: 10),
                child: TextWidget(
                  label: "ዕጣ ጣይዮች",
                  size: 18,
                  ftw: FontWeight.bold,
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      dropLott();
                    },
                    child: TextWidget(label: "Drop Ticket"),
                  )),
            ],
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
                itemCount: _authControler.userDetail!.length,
                itemBuilder: ((context, index) {
                  UserDetailModel _user = _authControler.userDetail![index];
                  return _lotterList(user: _user);
                })),
          ))
        ],
      ),
    );
  }

  Widget _lotterList({required UserDetailModel user}) {
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
                            label: user.userProfile!.firstName.toString() +
                                user.userProfile!.lastName.toString(),
                            size: 14,
                            color: AppColor.black,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          child: TextWidget(
                            label: user.userProfile!.phoneNumber.toString(),
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
                      label: Formatting.formatDate(user.createdAt.toString()),
                      color: AppColor.darkGray,
                      size: 12,
                    ),
                  )
                ],
              ),
            )));
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
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: AppColor.darkGray,
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColor.lightBlue),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {
                    {
                      handelSearchUser();
                    }
                  },
                  label: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 10),
                    child: Obx(
                      () => TextWidget(
                        label: _subController.searchResult == null
                            ? "እቁብ ጣይ"
                            : _subController
                                    .searchResult!.userProfile!.firstName
                                    .toString() +
                                " " +
                                _subController
                                    .searchResult!.userProfile!.lastName
                                    .toString(),
                        txa: TextAlign.start,
                        size: 16,
                      ),
                    ),
                  ),
                ),
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
                    if (_globalKey.currentState!.validate() &&
                        _subController.searchResult != null) {
                      _ticketController.dropTicketForClient(DropTicketModel(
                          amount: double.parse(_moneyController.text),
                          numberOfTickets: int.parse(_timesController.text),
                          userId: _subController.searchResult!.id));
                      if (_ticketController.isDrop) {
                        Get.back();
                        _moneyController.clear();
                        _timesController.clear();
                        _ticketController.isDrop = false;
                        _subController.searchResult = null;
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

  handelSearchUser() {
    Get.dialog(Scaffold(
      appBar: AppBar(
        title: TextWidget(
          label: "እቁብ ጣይ",
          size: 18,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
              child: inputField(
                  controller: _searchController,
                  hint: "search by phone...",
                  icon: Icons.search),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    _subController.searchUser(_searchController.text);
                    _searchController.clear();
                  }
                },
                child: TextWidget(label: "Search")),
            Obx(
              () => Container(
                  child: _subController.searchResult == null
                      ? TextWidget(label: "Search User")
                      : GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: _lotterList(
                                user: _subController.searchResult
                                    as UserDetailModel),
                          ),
                        )),
            )
          ],
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
