class License {
  int? id;
  int? licenseNumber;
  String? licenseIdReferenceFace;
  String? licenseIdReferenceBack;
  String? licenseType;
  int? userId;
  String? carName;
  String? createdAt;
  String? licenseExpireDate;
  String? carModel;
  String? carType;
  int? carYear;
  String? carPlatesNumber;
  String? carColor;

  License(
      {this.id,
      this.licenseNumber,
      this.licenseIdReferenceFace,
      this.licenseIdReferenceBack,
      this.licenseType,
      this.userId,
      this.carName,
      this.createdAt,
      this.licenseExpireDate,
      this.carModel,
      this.carType,
      this.carYear,
      this.carPlatesNumber,
      this.carColor});

  License.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    licenseNumber = json['license_number'];
    licenseIdReferenceFace = json['license_id_reference_face'];
    licenseIdReferenceBack = json['license_id_reference_back'];
    licenseType = json['license_type'];
    userId = json['user_id'];
    carName = json['car_name'];
    createdAt = json['Created_at'];
    licenseExpireDate = json['license_expire_date'];
    carModel = json['car_model'];
    carType = json['car_type'];
    carYear = json['car_year'];
    carPlatesNumber = json['car_plates_number'];
    carColor = json['car_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['license_number'] = this.licenseNumber;
    data['license_id_reference_face'] = this.licenseIdReferenceFace;
    data['license_id_reference_back'] = this.licenseIdReferenceBack;
    data['license_type'] = this.licenseType;
    data['user_id'] = this.userId;
    data['car_name'] = this.carName;
    data['Created_at'] = this.createdAt;
    data['license_expire_date'] = this.licenseExpireDate;
    data['car_model'] = this.carModel;
    data['car_type'] = this.carType;
    data['car_year'] = this.carYear;
    data['car_plates_number'] = this.carPlatesNumber;
    data['car_color'] = this.carColor;
    return data;
  }
}

class Payment {
  int? id;
  String? cardNumber;
  String? cardType;
  int? userId;
  String? cardExpireDate;
  String? createdAt;

  Payment(
      {this.id,
        this.cardNumber,
        this.cardType,
        this.userId,
        this.cardExpireDate,
        this.createdAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardNumber = json['card_number'];
    cardType = json['card_type'];
    userId = json['user_id'];
    cardExpireDate = json['card_expire_date'];
    createdAt = json['Created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_number'] = this.cardNumber;
    data['card_type'] = this.cardType;
    data['user_id'] = this.userId;
    data['card_expire_date'] = this.cardExpireDate;
    data['Created_at'] = this.createdAt;
    return data;
  }
}