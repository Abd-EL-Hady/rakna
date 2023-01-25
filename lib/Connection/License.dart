import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LicenseConnection {
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

  deleteLicenseData(String token, String id) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String base_url = "https://raknah.000webhostapp.com/api/";

    var response = await dio.delete(
        base_url + 'user/license/delete/' + id + '/' + token,
        options: Options(headers: {}));

    print(response.data);
    print(response.statusCode);
  }

  addLicenseData(
      String license_number,
      String license_type,
      String license_expire_date,
      String license_id_reference_face,
      String license_id_reference_back,
      String car_name,
      String car_model,
      String car_color,
      String car_plates_number,
      String car_type,
      String car_year) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String base_url = "https://raknah.000webhostapp.com/api/";

    var response =
        await dio.post(base_url + 'user/license/add/' + prefs.getString('token')! + '/' + prefs.getString('id')!,
            queryParameters: {
              'license_number': license_number,
              'license_type': license_type,
              'license_expire_date': license_expire_date,
              'license_id_reference_face': license_id_reference_face,
              'license_id_reference_back': license_id_reference_back,
              'car_name': car_name,
              'car_model': car_model,
              'car_color': car_color,
              'car_plates_number': car_plates_number,
              'car_type': car_type,
              'car_year': car_year
            },
            options: Options(headers: {}));

    print(response.data);
    print(response.statusCode);
  }
}
