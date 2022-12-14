import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rakna/model.dart';

class Connection {
  Future showLicenseData(String token) async {
    Dio dio = Dio();

    try {
      print('start');

      var response = await dio.get(
          "https://raknah.000webhostapp.com/api/user/license/show/202020202");

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  deleteData(String token) async {
    Dio dio = Dio();

    String base_url = "https://raknah.000webhostapp.com/api/";

    var response = await dio.delete(
        base_url + 'user/payment/show/' + token + '/' + token,
        options: Options(headers: {}));

    print(response.data);
    print(response.statusCode);
  }
}
