import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/auth/model/auth_model.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/user/model/user_detail_model.dart';

import '../api/api_endpoint.dart';
import '../api/baserepository/api.dart';

class AuthRepo {
  Future login(AuthModel data) async {
    // final connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   return AuthResponse.withError(
    //       success: false, msg: apiUtils.getNetworkError());
    // }
    log("login...");
    String url = Api.baseUrl + ApiEndPoints.login;

    try {
      final response = await apiUtils.post(url: url, data: data);

      return response.data;
    } catch (e) {
      return AuthResponse.withError(
          msg: apiUtils.handleError(e), success: false);
    }
  }

  Future<List<UserDetailModel>> getMyUsers() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.getMyUsers;

    final response = await apiUtils.get(url: url);

    List<UserDetailModel> result = List<UserDetailModel>.from(response.data.map(
      (res) => UserDetailModel.fromMap(res),
    ));

    return result;
  }
}
