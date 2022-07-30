import 'dart:developer';

import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/ticket/model/drop_ticket_model.dart';
import 'package:ekub/data/ticket/model/ticekt_model.dart';
import 'package:ekub/data/ticket/ticket_repo.dart';
import 'package:ekub/utils/message_widet.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  final _mylotto = <TicketModel>[].obs;
  final _authController = Get.find<AuthController>();

  final _isLoading = false.obs;

  final _isDrop = false.obs;
  List<TicketModel>? get myLotto => _mylotto;

  bool get isLoading => _isLoading.value;
  bool get isDrop => _isDrop.value;
  set isDrop(val) => _isDrop.value = val;

  void setLoading(bool show) {
    _isLoading.value = show;
    // _isLoading(true);
  }

  void dropTicket(DropTicketModel data) async {
    setLoading(true);
    try {
      final result = await TicketRepo().dropTicket(data);
      log(result.toString());
      if (result != null) {
        getMyTicket(_authController.userInfo!.id.toString());
        _isDrop.value = true;
        MessageHandler().displayMessage(msg: "drop success", title: "Drop");
        setLoading(false);
      } else {
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  void dropTicketForClient(DropTicketModel data) async {
    setLoading(true);
    try {
      final result = await TicketRepo().dropTicketForClint(data);
      log(result.toString());
      if (result != null) {
        _isDrop.value = true;

        MessageHandler().displayMessage(msg: "drop success", title: "Drop");
        setLoading(false);
      } else {
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  void getMyTicket(String id) async {
    try {
      final result = await TicketRepo().getMyLotto(id);

      _mylotto.value = result;
    } catch (e) {
      log("message$e");
    }
  }
}
