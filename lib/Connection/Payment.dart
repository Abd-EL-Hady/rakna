import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Payment{
  Future addPayment(String token) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('start');

      var response = await dio.post(
          base_url + 'user/payment/add/' + token,
          options: Options(headers: {}));

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future deletePayment(String token ,String id) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('start');

      var response = await dio.delete(
          base_url + 'user/payment/delete/' + id + '/' + token,
          options: Options(headers: {}));

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future showPayment(String token) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('start');

      var response = await dio.get(
          base_url + 'user/payment/show/' + token,
          options: Options(headers: {}));

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }
}