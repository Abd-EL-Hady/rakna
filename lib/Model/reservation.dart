class Reservation {
  int? id;
  int? licenseId;
  String? startDate;
  int? garageHolderId;
  String? endDate;
  int? hours;
  String? createdAt;
  int? status;
  int? paymentId;
  int? price;
  Null? checkInTime;
  Null? checkOutTime;

  Reservation(
      {this.id,
      this.licenseId,
      this.startDate,
      this.garageHolderId,
      this.endDate,
      this.hours,
      this.createdAt,
      this.status,
      this.paymentId,
      this.price,
      this.checkInTime,
      this.checkOutTime});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    licenseId = json['license_id'];
    startDate = json['start_date'];
    garageHolderId = json['garage_holder_id'];
    endDate = json['end_date'];
    hours = json['hours'];
    createdAt = json['Created_at'];
    status = json['status'];
    paymentId = json['payment_id'];
    price = json['price'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['license_id'] = this.licenseId;
    data['start_date'] = this.startDate;
    data['garage_holder_id'] = this.garageHolderId;
    data['end_date'] = this.endDate;
    data['hours'] = this.hours;
    data['Created_at'] = this.createdAt;
    data['status'] = this.status;
    data['payment_id'] = this.paymentId;
    data['price'] = this.price;
    data['check_in_time'] = this.checkInTime;
    data['check_out_time'] = this.checkOutTime;
    return data;
  }
}
