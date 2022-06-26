import 'package:get/get.dart';

displayMessage({required String title, required String msg}) {
  Get.snackbar(title, msg);
}
