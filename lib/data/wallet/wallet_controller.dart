import 'dart:developer';

import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/wallet/model/transaction_model.dart';
import 'package:ekub/data/wallet/model/wallet_mode.dart';
import 'package:ekub/data/wallet/repo/wallet_repo.dart';
import 'package:ekub/utils/message_widet.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  final _myWallet = WalletModel().obs;
  final _authController = Get.find<AuthController>();
  final _isLoading = false.obs;

  WalletModel? get myWallet => _myWallet.value;
  bool get isLoading => _isLoading.value;

  void setLoading(bool show) {
    _isLoading.value = show;
    // _isLoading(true);
  }

  void transferToUser(TransactionModel data) async {
    setLoading(true);
    try {
      final result = await WalletRepo().transferToUser(data);
      if (result != null) {
        MessageHandler()
            .displayMessage(msg: "Transaction is Done", title: "Transaction");
        setLoading(false);
      } else {
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  void topUpWallet(TransactionModel data) async {
    setLoading(true);
    try {
      final result = await WalletRepo().topUpWallet(data);
      log("toup=====$result");
      if (result != null) {
        MessageHandler()
            .displayMessage(msg: "Transaction is Done", title: "Transaction");
        setLoading(false);
        getWalletAccount(_authController.userInfo!.id.toString());
      } else {
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  void getWalletAccount(String id) async {
    try {
      final result = await WalletRepo().getWalletAccount(id);

      _myWallet.value = result;
    } catch (e) {
      log("message$e");
    }
  }
}
