import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/auth/model/auth_model.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/user/model/user.dart';

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

  Future<List<UserModel>> getUser() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.getAllUsers;

    final response = await apiUtils.get<List<Map<String, dynamic>>>(url: url);
    return response.data!.map((res) => UserModel.fromMap(res)).toList();
  }
}
