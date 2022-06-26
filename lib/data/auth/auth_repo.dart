import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/api/api_params.dart';
import 'package:ekub/data/auth/model/auth_model.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/user/model/user_responce.dart';

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

  Future getUser() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return AuthResponse.withError(
          success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.getAllUsers;

    try {
      final response = await apiUtils.get(url: url);

      return response.data;
    } catch (e) {
      return UserResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }
}
