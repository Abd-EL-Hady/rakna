import 'package:flutter/material.dart';
import 'package:rakna/Connection/PaymentConnection.dart';
import 'package:rakna/Connection/User.dart';
import 'package:rakna/Connection/Reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Connection/License.dart';
import '../Model/City.dart';
import '../Model/license.dart';
import '../Model/payment.dart';
import '../Model/reservation.dart';
import '../UI/home_page.dart';

class Business extends ChangeNotifier {
  List<License> license = [];
  List<Payment> payments = [];
  bool approved = false;

  List<Holders> garageHolders = [
    Holders(
        city: "القاهرة",
        name: "G-3",
        longitude: 31.2482,
        latitude: 30.0652,
        garageHolderId: 3,
        desription: "ميدان رمسيس مقابل جامع الفتح"),
    Holders(
        city: "المنصورة",
        name: "G-1",
        longitude: 31.3601,
        latitude: 31.0368,
        garageHolderId: 1,
        desription: "حي الجامعة - مقابل بوابة القرية الاولمبية"),
    Holders(
        city: "المنصورة",
        name: "G-2",
        longitude: 31.3573,
        latitude: 31.0455,
        garageHolderId: 2,
        desription: "المشاية العلوية مقابل بوابة البارون"),
  ];

  flipApproved() {
    approved = !approved;
    notifyListeners();
  }

  List<Reservation> reservation = [];

  getLicense() async {
    try {
      var response = await LicenseConnection().showLicenseData();
      license =
          response.map<License>((json) => License.fromJson(json)).toList();
      print(license.first.licenseNumber);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getPayments() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var response =
          await PaymentConnection().showPayment(prefs.getString('token')!);
      payments =
          response.map<Payment>((json) => Payment.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  login(String email, String password, BuildContext context) async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      var response = await UserConnection().login(email, password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', response['id'].toString());
      prefs.setString('email', response['email']);
      prefs.setString('password', password);
      prefs.setString('first_name', response['first_name']);
      prefs.setString('last_name', response['last_name']);
      prefs.setString('mobile_number', response['mobile_number']);
      prefs.setString('city', response['city']);
      prefs.setString('SSN', response['SSN']);
      prefs.setBool('isLogin', true);

      Navigator.pop(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );

      notifyListeners();
    } catch (e) {
      Navigator.pop(context);
      print(e);
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
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
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
      prefs.setBool('isLogin', true);

      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );

      notifyListeners();
    } catch (e) {
      Navigator.pop(context);
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

  updateDetails(BuildContext context) async {
    try {
      var response = await UserConnection().updateDetails(
          emailController.text,
          passwordController.text,
          first_nameController.text,
          last_nameController.text,
          mobile_numberController.text,
          cityController.text,
          SSNController.text);
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
      var response = await ReservationConnection().showReservData();
      reservation = response
          .map<Reservation>((json) => Reservation.fromJson(json))
          .toList();

      await getLicense();
      var a = await getPayments();
      print(a.toString());
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
      var response = await LicenseConnection().addLicenseData(
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

  addPayment(String card_number, String card_type, String card_expire_date,
      BuildContext context) async {
    try {
      // var response = await Payment().addPayment(
      //     card_number,
      //     card_type,
      //     card_expire_date);
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

  ////////////////////// Profile //////////////////////
  ///
  ///

  //
  TextEditingController emailController = TextEditingController()..text = " ";
  TextEditingController passwordController = TextEditingController()
    ..text = " ";
  TextEditingController first_nameController = TextEditingController()
    ..text = " ";
  TextEditingController last_nameController = TextEditingController()
    ..text = " ";
  TextEditingController mobile_numberController = TextEditingController()
    ..text = " ";
  TextEditingController cityController = TextEditingController()..text = " ";
  TextEditingController SSNController = TextEditingController()..text = " ";

  Future initProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailController.text = prefs.getString('email')!;
    passwordController.text = prefs.getString('password')!;
    first_nameController.text = prefs.getString('first_name')!;
    last_nameController.text = prefs.getString('last_name')!;
    mobile_numberController.text = prefs.getString('mobile_number')!;
    cityController.text = prefs.getString('city')!;
    SSNController.text = prefs.getString('SSN')!;

    notifyListeners();
  }
}
