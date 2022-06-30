import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekub/data/api/api_endpoint.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/api/baserepository/api.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/wallet/model/transaction_model.dart';
import 'package:ekub/data/wallet/model/wallet_mode.dart';

class WalletRepo {
  transferToUser(TransactionModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.transferMoney;

    final response = await apiUtils.post(url: url, data: data.toMap());
    return response.data;
  }

  topUpWallet(TransactionModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.transferWalletToSales;

    final response = await apiUtils.post(url: url, data: data.toMapTopUp());
    return response.data;
  }

  Future<WalletModel> getWalletAccount(String id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.getUserWalletAccount + "/$id";

    final response = await apiUtils.get<Map<String, dynamic>>(url: url);
    return WalletModel.fromMap(response.data!);
  }
}
