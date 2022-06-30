import 'package:get/get.dart';

class MessageHandler {
  displayMessage({required String title, required String msg}) {
    Get.snackbar(title, msg);
  }
}
