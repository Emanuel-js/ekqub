import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekub/data/api/log_intrapter.dart';
import 'package:ekub/utils/message_widet.dart';

const title = "ApiUtils";

ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  static final ApiUtils _apiUtils = ApiUtils._i();

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: 25000,
    receiveTimeout: 15000,
  ));

  ApiUtils._i() {
    _dio.interceptors.add(CustomLogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    ));
  }

  factory ApiUtils() {
    return _apiUtils;
  }

  Map<String, String> header = {"Content-Type": "application/json"};

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  Map<String, String> secureHeaders = {
    "Content-Type": "application/json",
  };

  Future<Response<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response<T> result = await _dio.get<T>(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> post({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Sending FormData:
    //FormData formData = FormData.fromMap({"name": ""});

    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return result;
  }

  Future<Response> postWithProgress({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    //
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
    );
    return result;
  }

  Future<Response> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> patch({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Options options = Options(headers: secureHeaders);

    //var result = await _dio.delete(api, options: options);
    var result = await _dio.delete(
      api,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  String handleError(dynamic error) {
    String errorDescription = "";

    if (error is DioError) {
      DioError dioError = error;

      if (dioError.response != null) {
        var msg = dioError.response;
        displayMessage(
            title: "message",
            msg: dioError.response!.data["httpmessage"].toString());

        log("dioError:: response ++>> " + dioError.response.toString());
      }

      switch (dioError.type) {
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${dioError.response?.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    log("handleError:: errorDescription >> $errorDescription");

    return errorDescription;
  }

  getFormattedError() {
    return {'error': 'Error'};
  }

  getNetworkError() {
    return "No Internet Connection.";
  }
}
