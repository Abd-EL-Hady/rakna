import 'package:flutter/foundation.dart';
import 'package:rakna/model.dart';

import 'connection.dart';

class Business extends ChangeNotifier {
  List<License> license = [];
  getLicense() async {
    try {
      var response = await Connection().showLicenseData('1010101010');
      license =
          response.map<License>((json) => License.fromJson(json)).toList();
      print(license[0].licenseNumber);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
