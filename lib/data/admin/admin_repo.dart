import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ekub/data/admin/analytics_model.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/user/model/user.dart';
import 'package:ekub/utils/message_widet.dart';

import '../api/api_endpoint.dart';
import '../api/baserepository/api.dart';

class AdminRepo {
  Future registerMainCollector(UserModel data, File? image) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return AuthResponse.withError(
          success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.manCollectorRegister;

    try {
      var request = {
        ...data.toMap(),
        "fileupload": await MultipartFile.fromFile(image!.path),
      };

      FormData formData = FormData.fromMap(request);

      final response = await apiUtils.post(url: url, data: formData);

      return response.data;
    } catch (e) {
      return AuthResponse.withError(
          msg: apiUtils.handleError(e), success: false);
    }
  }

  Future<AnalyticsModel> getAnalytics() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      AuthResponse.withError(success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.analytics;

    final response = await apiUtils.get(url: url);
    if (response.data["success"] == false) {
      MessageHandler()
          .displayMessage(title: "Message", msg: response.data["message"]);
      return response.data["message"];
    }

    return AnalyticsModel.fromMap(response.data);
  }
}
