import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class UserConnection{
  Future Login(String email, String password) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseMessaging.instance.getToken().then((value) {

      prefs.setString('token', value!);});



    try {
      print('start');

      var response = await dio.get(
          base_url + 'user/login/"' + email + '/' + password + '/' +
              prefs.getString('token')!);

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future signUp(String email, String password,String first_name,String last_name,String mobile_number,String city,int SSN) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseMessaging.instance.getToken().then((value) {

      prefs.setString('token', value!);});



    try {
      print('start');

      var response = await dio.post(
          base_url + 'user/signup'
          ,queryParameters: {"first_name": first_name ,"last_name" : last_name, "mobile_number" : mobile_number,"city" : city , "SSN": SSN, "token": prefs.getString('token')!, "email" : email , "password" : password});

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future updateDetails(String id,String token,String email, String password,String first_name,String last_name,String mobile_number,String city,int SSN) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseMessaging.instance.getToken().then((value) {

      prefs.setString('token', value!);});



    try {
      print('start');

      var response = await dio.put(
          base_url + 'user/update/' + id + '/' + token + '/'
          ,queryParameters: {"first_name": first_name ,"last_name" : last_name, "mobile_number" : mobile_number,"city" : city , "SSN": SSN, "token": prefs.getString('token')!, "email" : email , "password" : password});

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future logout(String email,String token) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseMessaging.instance.getToken().then((value) {

      prefs.setString('token', value!);});



    try {
      print('start');

      var response = await dio.post(
          base_url + 'user/update/' + email + '/' + token);

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future userDelete(String id,String token) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseMessaging.instance.getToken().then((value) {

      prefs.setString('token', value!);});



    try {
      print('start');

      var response = await dio.delete(
          base_url + 'user/delete/' + id + '/' + token);

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future forgetPassword(String email) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseMessaging.instance.getToken().then((value) {

      prefs.setString('token', value!);});



    try {
      print('start');

      var response = await dio.get(
          base_url + 'user/forgetPassword/' + email );

      print(response.data);
      print(response.statusCode.toString());

      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}