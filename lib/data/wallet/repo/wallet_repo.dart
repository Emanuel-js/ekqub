import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekub/data/api/api_endpoint.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/api/baserepository/api.dart';
import 'package:ekub/data/wallet/model/refend_model.dart';
import 'package:ekub/data/wallet/model/refund_requst_approved_model.dart';
import 'package:ekub/data/wallet/model/refund_responce_model.dart';
import 'package:ekub/data/wallet/model/saving_account_model.dart';
import 'package:ekub/data/wallet/model/transaction_model.dart';
import 'package:ekub/data/wallet/model/trnsactionResponce.dart';
import 'package:ekub/data/wallet/model/wallet_mode.dart';
import 'package:ekub/utils/message_widet.dart';

class WalletRepo {
  transferToUser(TransactionModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.transferMoney;

    final response = await apiUtils.post(url: url, data: data.toMap());
    return response.data;
  }

  topUpWallet(TransactionModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.transferWalletToSales;

    final response = await apiUtils.post(url: url, data: data.toMapTopUp());
    return response.data;
  }

  Future<WalletModel> getWalletAccount(String id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.getUserWalletAccount + "/$id";

    final response = await apiUtils.get(url: url);
    return WalletModel.fromMap(response.data!);
  }

  Future<List<TransactionResponseModel>> getTransactionHistory(
      String id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.transactionHistory + "/$id";

    final response = await apiUtils.get(url: url);

    List<TransactionResponseModel> res = List<TransactionResponseModel>.from(
        response.data.map((x) => TransactionResponseModel.fromMap(x)));

    return res;
  }

  Future<SavingAccountModel> getSavingBalance(String id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.savingAccount + "/$id";

    final response = await apiUtils.get(url: url);

    return SavingAccountModel.fromMap(response.data);
  }

  requestReFund(RefundResponseModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.requestRefund;

    final response = await apiUtils.post(url: url, data: data.toMap());
    return response.data;
  }

  Future<List<RefundModel>> getReqRefund() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.getReqRefund;

    final response = await apiUtils.get(url: url);
    List<RefundModel> result = List<RefundModel>.from(response.data.map(
      (res) => RefundModel.fromMap(res),
    ));

    return result;
  }

  requestReFundApproval(RefundRequestApprovedModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageHandler().displayMessage(
          msg: apiUtils.getNetworkError(), title: "Network Error");
    }

    String url = Api.baseUrl + ApiEndPoints.requestApprove;

    final response = await apiUtils.post(url: url, data: data.toMap());
    return response.data;
  }
}
