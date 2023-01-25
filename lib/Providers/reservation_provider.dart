import 'package:flutter/material.dart';
import 'package:rakna/Connection/Payment.dart';
import 'package:rakna/Connection/Reservation.dart';
import 'package:rakna/Model/license.dart';
import 'package:rakna/Model/reservation.dart';
import 'package:rakna/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Connection/License.dart';
import '../Model/City.dart';

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

  getLicenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = await LicenseConnection()
        .showLicenseData(prefs.getInt("user_id").toString());
    print(data);
    return data;
  }
}
