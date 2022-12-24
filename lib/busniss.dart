import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rakna/Connection/User.dart';
import 'package:rakna/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Connection/License.dart';
import 'UI/home_page.dart';

class Business extends ChangeNotifier {
  List<License> license = [];
  getLicense(String id) async {
    try {
      var response = await Connection().showLicenseData(id);
      license =
          response.map<License>((json) => License.fromJson(json)).toList();
      print(license[0].licenseNumber);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  login(String email,String password,BuildContext context) async {
    try {
      var response = await UserConnection().login(email, password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', response['id']);
      prefs.setString('email', response['email']);
      prefs.setString('first_name', response['first_name']);
      prefs.setString('last_name', response['last_name']);
      prefs.setString('mobile_number', response['mobile_number']);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );

      notifyListeners();
    } catch (e) {
      print(e);
    }

  }
}
