import 'package:flutter/foundation.dart';
import 'package:rakna/model.dart';

import 'Connection/License.dart';

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
}
