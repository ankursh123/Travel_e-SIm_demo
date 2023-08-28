import 'dart:convert';
import 'package:http/http.dart' as http;
import 'appExceptions.dart';

/// Created by Appinventiv  on [16-Aug-2023].
class ApiClient {

  ApiStatusCode returnResponseStatus(http.Response response) {
    switch(response.statusCode) {
      case 200:
        return ApiStatusCode.success;
      case 401:
        return ApiStatusCode.unauthorized;
      case 500:
        return ApiStatusCode.serverError;
      case 404:
        return ApiStatusCode.notFound;
      default:
        return ApiStatusCode.unknownError;
    }
  }

  ///GET API METHOD.
  getAPI(String url) async {
    Map<String, String> headers = {};
    Map<String, String> params = {};

    ///To create custom URI when params need to parse with apiURL.
    var uri = Uri.http("baseURL", "apiPath", params);

    final response = await http.get(Uri.parse(url), headers: headers)
        .timeout(const Duration(seconds: 10));
    ApiStatusCode apiStatusCode = returnResponseStatus(response);
    if(apiStatusCode == ApiStatusCode.success) {
      var body = jsonDecode(response.body);
      return body;
    } else {
      throw(apiStatusCode.value);
    }

  }

  ///POST API METHOD.
  Future<Map<String, dynamic>> postAPI(String url) async{

    final response = await http.post(Uri.parse(url), headers: {}, body: {})
      .timeout(const Duration(seconds: 10));
    ApiStatusCode apiStatusCode = returnResponseStatus(response);
    if(apiStatusCode == ApiStatusCode.success) {
      var body = jsonDecode(response.body);
      return body;
    } else {
      throw(apiStatusCode.value);
    }

  }

}