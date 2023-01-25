

class Holders {
  String? name;
  String? city;
  double? longitude;
  double? latitude;
  int? garageHolderId;
  String? desription;

  Holders(
      {this.name,
      this.longitude,
      this.latitude,
      this.garageHolderId,
      this.desription,
      this.city});

  Holders.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    garageHolderId = json['garage_holder_id'];
    desription = json['desription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['garage_holder_id'] = this.garageHolderId;
    data['desription'] = this.desription;
    return data;
  }
}
