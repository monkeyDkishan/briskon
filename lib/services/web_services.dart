import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WebService {
  WebService();

  static final _instance = WebService();

  static WebService get instance => _instance;

  final _dio = Dio();

  get({required NetworkRequest request}) async {
    if (kDebugMode) {
      log(request.toString());
    }

    try {
      Response response = await _dio
          .get(request.url, queryParameters: request.queryParameters)
          .timeout(const Duration(seconds: 60));

      if (kDebugMode) {
        log(request.toResponseString(response.data));
      }

      return response.data;
    } on DioError catch (e) {
      decodeErrorResponse(error: e, request: request);
    } on SocketException {
      throw "Internet connection not available";
    } catch (e) {
      rethrow;
    }
  }

  post({required NetworkRequest request}) async {
    if (kDebugMode) {
      log(request.toString());
    }

    try {
      Response response = await _dio
          .post(request.url,
              queryParameters: request.queryParameters, data: request.data)
          .timeout(const Duration(seconds: 60));

      if (kDebugMode) {
        log(request.toResponseString(response.data));
      }

      return response.data;
    } on DioError catch (e) {
      decodeErrorResponse(error: e, request: request);
    } on SocketException {
      throw "Internet connection not available";
    } catch (e) {
      rethrow;
    }
  }

  decodeErrorResponse({required DioError error, required NetworkRequest request}) {

    if (kDebugMode) {
      log(request.toErrorString(error));
    }

    switch (error.type) {
      case DioErrorType.connectTimeout:
        throw 'Connection timeOut';
      case DioErrorType.sendTimeout:
        throw 'Connection timeOut';
      case DioErrorType.receiveTimeout:
        throw 'Connection timeOut';
      case DioErrorType.response:
        throw 'Something went wrong.';
      case DioErrorType.cancel:
        throw 'Request Canceled by user';
      case DioErrorType.other:
        if (error.message.contains('SocketException')) {
          throw "Internet connection not available";
        }
        throw 'Something went wrong.';
    }
  }
}

class NetworkRequest {
  final String url;
  final Map<String, dynamic>? queryParameters;
  final dynamic data;

  NetworkRequest({required this.url, this.queryParameters, this.data});

  String toErrorString(DioError error) {
    try {
      final uri = Uri.parse(url);

      final log = '''===⚠️ START ERROR ⚠️===
      
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      Error:
        Error Response is for ${error.response?.toString()}
        Error = ${error.error?.toString()}
        
===⚠️ END ERROR ⚠️===''';

      return log;
    } catch (e) {
      return '''===⚠️ START ERROR ⚠️===
      
      URL = $url
      Data = ${getFormData()}
      Error:
        Error Response is for ${error.response?.toString()}
        Error = ${error.error?.toString()}
        
===⚠️ END ERROR ⚠️===''';
    }
  }

  String toResponseString(dynamic response) {
    try {
      final uri = Uri.parse(url);

      final log = '''===👍️ START RESPONSE 👍===
      
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      Response:
        $response
        
===👍️ END RESPONSE 👍===''';

      return log;
    } catch (e) {
      return '''===👍️ START RESPONSE 👍===
      
      URL = $url
      Data = ${getFormData()}
      Response:
        $response
        
===👍️ END RESPONSE 👍===
      ''';
    }
  }

  dynamic getFormData() {
    if(data is FormData) {
      final formData = data as FormData;
      return formData.fields;
    } else {
      return data;
    }
  }

  @override
  toString() {
    try {
      final uri = Uri.parse(url);

      final log = '''===🌐 START REQUEST 🌐===
      
      API is for ${uri.pathSegments.last}
      URL = ${Uri(queryParameters: queryParameters, host: uri.host, path: uri.path, scheme: uri.scheme, port: uri.port, userInfo: uri.userInfo)}
      Data = ${getFormData()}
      
      ===🌐 END REQUEST 🌐===''';

      return log;
    } catch (e) {
      return "API is for $url\nQuery = $queryParameters\n Data = $data";
    }
  }
}
