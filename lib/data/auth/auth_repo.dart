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
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return AuthResponse.withError(
          success: false, msg: apiUtils.getNetworkError());
    }

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
    // log(response.data.toString());

    // log(x["userProfile"].toString());

    // var b = UserDetailModel(
    //   id: x["id"],
    //   createdBy: x["createdBy"],
    //   createdAt: x["createdAt"],
    //   email: x["email"],
    //   accountNonLocked: x["accountNonLocked"],
    //   failedAttempt: x["failedAttempt"],
    //   lockTime: x["lockTime"],
    //   updatedAt: x["updatedAt"],
    //   updatedBy: x["updatedBy"],
    //   role: x["role"],
    //   userProfile: x["userProfile"],
    // );
    // log(b.toString());

    List<UserDetailModel> result = List<UserDetailModel>.from(response.data.map(
      (res) => UserDetailModel.fromMap(res),
    ));

    log(result.toString());
    return result;
  }
}
