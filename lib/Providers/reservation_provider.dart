import 'package:flutter/material.dart';
import 'package:rakna/Connection/PaymentConnection.dart';
import 'package:rakna/Connection/Reservation.dart';
import 'package:rakna/Model/license.dart';
import 'package:rakna/Model/reservation.dart';
import 'package:rakna/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Connection/License.dart';
import '../Model/City.dart';
import '../Model/payment.dart';

class ReservationProvider with ChangeNotifier {
  List avilaibletimes = [];
  int? selectedTime = -1;
  Holders selectedGarageHolder = Holders();
  License selectedLicense = License();
  Payment selectedPayment = Payment();

  List governments = [
    'القاهرة',
    'الدقهلية',
  ];

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

  getAvilableTimes({required DateTime date, required int garageHolder}) async {
    avilaibletimes = [];
    if (DateTime.now().isAfter(date)) {
      showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("لا يمكنك حجز موعد في الماضي"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"))
              ],
            );
          });
      return;
    }
    date = DateTime(date.year, date.month, date.day);

    var data = await ReservationConnection().showAvilableReservData(
        date: date.toString(), garage_holder_id: garageHolder.toString());

    avilaibletimes = data;

    print(avilaibletimes);

    notifyListeners();
  }

  toggleGarageHolder(Holders garageHolder) {
    selectedGarageHolder = garageHolder;
    notifyListeners();
  }

  toggleTime(int time) {
    selectedTime = time;
    notifyListeners();
  }

  toggleLicense(License license) {
    selectedLicense = license;
    notifyListeners();
  }

  togglePayment(Payment payment) {
    selectedPayment = payment;
    notifyListeners();
  }

  getLicenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = await LicenseConnection().showLicenseData();
    print(data);
    return data;
  }

  addReservation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(DateTime.now().toString().split('.')[0]);
    var data = await ReservationConnection().createReservData(
        start_date: DateTime.now().toString().split(".")[0],
        end_date:
            DateTime.now().add(Duration(hours: 1)).toString().split(".")[0],
        license_id: selectedLicense.id.toString(),
        garage_holder_id: selectedGarageHolder.garageHolderId.toString(),
        cvv: '123',
        price: "100",
        payment_id: selectedPayment.id.toString());
    print(data);
    return data;
  }
}
