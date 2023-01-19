import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservConnection {
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
}