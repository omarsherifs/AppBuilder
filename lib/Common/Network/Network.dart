import 'dart:convert';
import 'package:dio/dio.dart';

class Network {
  static String baseUrl;
  final int appVersion = 1;
  Map<String, String> _headers = {
    'Accept': 'application/json',
  };

  Future<Response> getData({String url}) async {
    Dio dio = Dio();
    _headers.addAll({'version': "$appVersion"});
    Response response =
        await dio.get("$baseUrl/" + url, options: Options(headers: _headers));
    if (response.statusCode != 200) {
      errorHandler(response.data, response.statusCode);
    }
    return response;
  }

  void errorHandler(String errorBody, int statusCode) {
    String message = "";
    if (errorBody != null) {
      String body = errorBody;
      var jsonObject = jsonDecode(body);
      message = jsonObject['message'];
      print("$message");
      // Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
    }
  }
}
