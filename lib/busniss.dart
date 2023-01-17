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
  bool approved = false;

  flipApproved() {
    approved = !approved;
    notifyListeners();
  }

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

  login(String email, String password, BuildContext context) async {
    try {
      var response = await UserConnection().login(email, password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', response['id'].toString());
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
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Wrong Email or Password'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'))
              ],
            );
          });
    }
  }

  signup(
      String email,
      String password,
      String first_name,
      String last_name,
      String mobile_number,
      String city,
      String SSN,
      String SSN_reference_back,
      String SSN_reference_face,
      BuildContext context) async {
    try {
      var response = await UserConnection().signUp(
          email,
          password,
          first_name,
          last_name,
          mobile_number,
          city,
          SSN,
          SSN_reference_back,
          SSN_reference_face);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', response['id'].toString());
      prefs.setString('email', response['email']);
      prefs.setString('first_name', response['first_name']);
      prefs.setString('last_name', response['last_name']);
      prefs.setString('mobile_number', response['mobile_number'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );

      notifyListeners();
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Invalid Credentials'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'))
              ],
            );
          });
      print(e);
    }
  }
}
