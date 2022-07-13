import 'package:ekub/screens/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AdminMainCollectorDetail extends StatelessWidget {
  const AdminMainCollectorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // title
            Container(
              child: TextWidget(
                label: "Detail",
                // color: AppColor.black,
              ),
            ),
            //image

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
    );
  }
}
