import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/user/model/user.dart';

import '../api/api_endpoint.dart';
import '../api/baserepository/api.dart';

class SubCollectorRepo {
  Future registerSubCollector(UserModel data, File? image) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return AuthResponse.withError(
          success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.clientRegister;

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

  Future updatePersonalInfo(UserModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return AuthResponse.withError(
          success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.updateMainCollector;

    try {
      final response = await apiUtils.patch(url: url, data: {
        "phoneNumber": data.phoneNumber,
        "alternatePhoneNumber": "string",
        "residentLocation": "string",
        "city": data.city,
        "yearBorn": data.yearBorn,
        "gender": data.gender,
        "latitude": data.latitude,
        "longitude": data.longitude
      });

      return response.data;
    } catch (e) {
      return AuthResponse.withError(
          msg: apiUtils.handleError(e), success: false);
    }
  }
}
