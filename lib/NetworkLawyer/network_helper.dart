import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Utility/constant.dart';

class NetworkHelper {
  // function to call get service
  Future<dynamic> makeGetRequestWithTimeout(String service, int timeout) async {
    var responseJson;
    try {
      print(service);
      final url = Uri.parse(service);
      final response = await http.get(url).timeout(Duration(seconds: timeout));

      if (response.statusCode != 200) {
        throw Exception("Failed to login");
      } else {
        responseJson = json.decode(response.body);
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find data");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request timeout");
    }
    return responseJson;
  }

  // function to call get service
  Future<dynamic> makeGetRequest(String service) async {
    var responseJson;
    try {
      final url = Uri.parse(urlPrefix + service);
      final headers = {"Content-type": "application/json"};
      final response =
          await http.get(url, headers: headers).timeout(Duration(seconds: 5));
      if (response.statusCode == 200 || response.statusCode == 401) {
        responseJson = json.decode(response.body.toString());
      } else {
        throw Exception("Failed to get data");
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find data");
    } on FormatException {
      throw Exception("Bad response format");
    }
    return responseJson;
  }

  // function to call get service
  Future<dynamic> makeAuthGetRequest(String service) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    try {
      final url = Uri.parse(urlPrefix + service);
      var _token = prefs.getString("token");

      final headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $_token",
      };
      final response =
          await http.get(url, headers: headers).timeout(Duration(seconds: 5));
      if (response.statusCode == 200 || response.statusCode == 401) {
        responseJson = json.decode(response.body.toString());
      } else {
        throw Exception("Failed to get data");
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find data");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request Time out");
    }
    return responseJson;
  }

  // function to call post service
  Future<dynamic> makePostRequest(String service, Map data) async {
    var responseJson;
    try {
      final url = Uri.parse(urlPrefix + service);
      print(url);
      // final headers = {"Content-type": "application/json"};
      final response =
          await http.post(url, body: data).timeout(Duration(seconds: 3));

      if (response.statusCode != 200) {
        throw Exception("Failed to login");
      } else {
        responseJson = json.decode(response.body.toString());
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find data");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request timeout");
    }
    return responseJson;
  }

  // function to call post service with auth tocken
  Future<dynamic> makeAuthPostRequest(String service, Map data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    try {
      final url = Uri.parse(urlPrefix + service);
      var _token = prefs.getString("token");
      final headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $_token",
      };
      final response = await http
          .post(url, headers: headers, body: data)
          .timeout(Duration(seconds: 3));

      if (response.statusCode != 200) {
        throw Exception("Failed to login");
      } else {
        responseJson = json.decode(response.body.toString());
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find data");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request timeout");
    }
    return responseJson;
  }

  // function to call post service with auth tocken
  Future<dynamic> makeAuthMultipartRequest(
      String service, String path, Map<String, String> fields) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responseJson;
    try {
      final url = Uri.parse(urlPrefix + service);
      var _token = prefs.getString("token");
      final headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $_token",
      };
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(headers);
      if (path != '') {
        request.files
            .add(await http.MultipartFile.fromPath("user_image", path));
      }
      request.fields.addAll(fields);

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 401) {
        final res = await http.Response.fromStream(response);
        responseJson = json.decode(res.body);
      } else {
        throw Exception("Failed to post data");
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException {
      throw Exception("Couldn't find data");
    } on FormatException {
      throw Exception("Bad response format");
    } on TimeoutException {
      throw Exception("Request Time out");
    }
    return responseJson;
  }
}
