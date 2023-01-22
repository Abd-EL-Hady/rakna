import 'package:flutter/material.dart';
import 'package:rakna/Connection/User.dart';
import 'package:rakna/Connection/Reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Connection/License.dart';
import 'Connection/Payment.dart';
import 'Model/license.dart';
import 'Model/reservation.dart';
import 'UI/home_page.dart';

class Business extends ChangeNotifier {
  List<License> license = [];
  bool approved = false;

  flipApproved() {
    approved = !approved;
    notifyListeners();
  }

  List<Reservation> reservation = [];

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
  updateDetails(
      String email,
      String password,
      String first_name,
      String last_name,
      String mobile_number,
      String city,
      String SSN,
      BuildContext context) async {
    try {
      var response = await UserConnection().updateDetails(
          email,
          password,
          first_name,
          last_name,
          mobile_number,
          city,
          SSN);
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
              content: const Text('Could not update details'),
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

  getReservation() async {
    try {
      var response = await ReservConnection().showReservData();
      reservation = response
          .map<Reservation>((json) => Reservation.fromJson(json))
          .toList();
      print(reservation);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  addLicense(
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
  String car_year,
      BuildContext context) async {
    try {
      var response = await Connection().addLicenseData(
          license_number,
          license_type,
          license_expire_date,
          license_id_reference_face,
          license_id_reference_back,
          car_name,
          car_model,
          car_color,
          car_plates_number,
          car_type,
          car_year);
      SharedPreferences prefs = await SharedPreferences.getInstance();
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
              content: const Text('Could not add license'),
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

  addPayment(
  String card_number,
      String card_type,
  String card_expire_date,
      BuildContext context) async {
    try {
      var response = await Payment().addPayment(
          card_number,
          card_type,
          card_expire_date);
      SharedPreferences prefs = await SharedPreferences.getInstance();
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
              content: const Text('Could not add payment'),
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
