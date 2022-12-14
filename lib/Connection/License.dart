import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rakna/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Connection {
  Future showLicenseData(String id) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('start');
      var response = await dio.get(
        "https://raknah.000webhostapp.com/api/user/license/show/" +
            prefs.getString('token')!,
        queryParameters: {'id': id},
      );

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  deleteLicenseData(String token,String id) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String base_url = "https://raknah.000webhostapp.com/api/";

    var response = await dio.delete(
        base_url + 'user/license/delete/' + id + '/' + token,
        options: Options(headers: {}));

    print(response.data);
    print(response.statusCode);
  }

  addLicenseData(String token,String id) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String base_url = "https://raknah.000webhostapp.com/api/";

    var response = await dio.post(
        base_url + 'user/license/add/' + id + '/' + token,
        options: Options(headers: {}));

    print(response.data);
    print(response.statusCode);
  }

}
