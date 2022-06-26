import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekub/data/api/api_helper.dart';
import 'package:ekub/data/auth/model/auth_response.dart';
import 'package:ekub/data/maincollector/main_collector_model.dart';
import 'package:ekub/data/subcollector/sub_collector_model.dart';

import '../api/api_endpoint.dart';
import '../api/baserepository/api.dart';

class ManiCollectorRepo {
  Future registerSubCollector(SubCollectorModel data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return AuthResponse.withError(
          success: false, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.subCollectorRegister;

    try {
      final response = await apiUtils.post(url: url, data: {
        "firstName": data.firstName,
        "lastName": data.lastName,
        "username": data.username,
        "email": data.email,
        "password": data.lastName
      });

      return response.data;
    } catch (e) {
      return AuthResponse.withError(
          msg: apiUtils.handleError(e), success: false);
    }
  }

  Future updatePersonalInfo(MainCollectorModel data) async {
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
