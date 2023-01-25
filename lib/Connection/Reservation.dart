import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ReservationConnection {
  Future showReservData() async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('start');

      var response = await dio.get(
          "https://raknah.000webhostapp.com/api/user/reservation/show/" +
              prefs.getString('token')!);

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future deleteReservData(int id) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('start');

      var response = await dio.delete(
          "https://raknah.000webhostapp.com/api/user/reservation/delete/" +
              prefs.getString('token')! +
              "/" +
              id.toString());

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future createReservData({
    required String start_date,
    required String end_date,
    required String license_id,
    required String garage_holder_id,
    required String cvv,
    required String price,
    required String payment_id,
  }) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('start');

      var response = await dio.post(
          base_url + "user/reservation/add/" + prefs.getString('token')!,
          data: {
            "start_date": start_date,
            "end_date": end_date,
            "license_id": license_id,
            "garage_holder_id": garage_holder_id,
            "cvv": cvv,
            "price": price,
            "payment_id": payment_id,
          });

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future showAvilableReservData({
    required String date,
    required String garage_holder_id,
  }) async {
    Dio dio = Dio();

    try {
      print('start');

      var response = await dio.get(
          "https://raknah.000webhostapp.com/api/user/reservation/available-times/" +
              garage_holder_id +
              "/" +
              date);

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
