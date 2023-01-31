import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class PaymentConnection {
  Future addPayment(
      String card_number, String card_type, String card_expire_date) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String base_url = "https://raknah.000webhostapp.com/api/";
    try {
      print('start');

      var response = await dio.post(
          base_url + 'user/payment/add/' + prefs.getString('token')!,
          queryParameters: {
            'card_number': card_number,
            'card_type': card_type,
            'card_expire_date': card_expire_date,
          },
          options: Options(headers: {}));

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future deletePayment(String token, String id) async {
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

      var response = await dio.get(base_url + 'user/payment/show/' + token,
          options: Options(headers: {}));

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
