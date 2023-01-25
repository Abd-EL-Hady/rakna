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
