import 'dart:developer';

import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/wallet/model/refend_model.dart';
import 'package:ekub/data/wallet/model/saving_account_model.dart';
import 'package:ekub/data/wallet/model/transaction_model.dart';
import 'package:ekub/data/wallet/model/trnsactionResponce.dart';
import 'package:ekub/data/wallet/model/wallet_mode.dart';
import 'package:ekub/data/wallet/repo/wallet_repo.dart';
import 'package:ekub/utils/message_widet.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  final _myWallet = WalletModel().obs;
  final _mySavingBalance = SavingAccountModel().obs;
  final _myTransaction = <TransactionResponseModel>[].obs;
  final _refundController = <RefundModel>[].obs;
  final _authController = Get.find<AuthController>();
  final _isRefund = false.obs;

  final _isLoading = false.obs;

  WalletModel? get myWallet => _myWallet.value;
  SavingAccountModel? get mySavingBalance => _mySavingBalance.value;

  List<TransactionResponseModel>? get myTransaction => _myTransaction;

  List<RefundModel>? get refundController => _refundController;

  bool get isLoading => _isLoading.value;
  bool get isRefund => _isRefund.value;

  set isRefund(bool value) => _isRefund.value = value;

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

      if (result != null) {
        MessageHandler()
            .displayMessage(msg: "Transaction is Done", title: "Transaction");
        setLoading(false);
        getWalletAccount(_authController.userInfo!.id.toString());
        getSavingBalance(_authController.userInfo!.id.toString());
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

  void getTransactionHistory(String id) async {
    try {
      final result = await WalletRepo().getTransactionHistory(id);

      _myTransaction.value = result;
    } catch (e) {
      log("message$e");
    }
  }

  void getSavingBalance(String id) async {
    try {
      final result = await WalletRepo().getSavingBalance(id);

      _mySavingBalance.value = result;
    } catch (e) {
      log("message$e");
    }
  }

  void requestRefund(RefundModel data) async {
    setLoading(true);
    try {
      final result = await WalletRepo().requestReFund(data);

      if (result["id"].toString().isNotEmpty) {
        MessageHandler()
            .displayMessage(msg: "Request Refund is Done!", title: "Request");
        setLoading(false);
        _isRefund.value = true;
      } else {
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
    }
  }

  void getReqRefunds() async {
    try {
      final result = await WalletRepo().getReqRefund();

      _refundController.value = result;
    } catch (e) {
      log("message$e");
    }
  }
}
