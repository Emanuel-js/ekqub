import 'dart:developer';

import 'package:ekub/data/api/baserepository/api.dart';
import 'package:ekub/data/user/model/user_detail_model.dart';
import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminMainCollectorDetail extends StatelessWidget {
  const AdminMainCollectorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailModel user = Get.arguments;

    final double longt = double.parse(user.userProfile!.longitude.toString());
    final double lat = double.parse(user.userProfile!.latitude.toString());

    log("long $longt lat $lat");

    _getLaocation(longt, lat) async {}

    var _controller = StaticMapController(
        googleApiKey: Api.api_key,
        width: 400,
        height: 400,
        zoom: 10,
        language: "et",
        center: Location(lat, longt));
    ImageProvider image = _controller.image;
    _launchCaller(String phone) async {
      final Uri _url = Uri.parse('tel:$phone');
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    _launchEmail(String email) async {
      final Uri _url = Uri.parse("mailto:$email");
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Hero(
                    tag: user.id.toString(),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          "https://i.pravatar.cc/300",
                          width: 150,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextWidget(
                          label: user.userProfile!.firstName.toString() +
                              " " +
                              user.userProfile!.lastName.toString(),
                          size: 18,
                          ftw: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Container(
                        child: TextWidget(
                          label: user.userProfile!.city.toString(),
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  _launchCaller(
                                      user.userProfile!.phoneNumber.toString());
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.yellow[900],
                                )),
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  _launchEmail(
                                      user.userProfile!.email.toString());
                                },
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.green[900],
                                )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),

              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: const Icon(Icons.location_on),
                          ),
                          Container(
                            child: TextWidget(
                              label: "Address",
                              size: 18,
                              ftw: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: TextWidget(
                          label: "You can Find this\n Main Collector here",
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: image,
                          width: 150,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.5,
                    child: Image.network(
                      user.userProfile!.idCardImageUrl.toString(),
                      width: Get.width * 0.5,
                      height: Get.height * 0.5,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: const Icon(FontAwesomeIcons.idCard),
                            ),
                            SizedBox(
                              width: Get.width * 0.03,
                            ),
                            Container(
                              child: TextWidget(
                                label: "ID Card",
                                size: 18,
                                ftw: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: TextWidget(
                            label: "User Identification card",
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                ],
              ),

              //name
              //date
              // take   // get

              // email
              //phone
              // alt phone
              //city
              //location
              // id
            ],
          ),
        ),
      ),
    );
  }
}
