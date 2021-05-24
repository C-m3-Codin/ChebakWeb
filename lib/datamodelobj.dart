import 'dart:convert';

// QrObj welcomeFromJson(String str) => QrObj.fromJson(json.decode(str));
//
// String welcomeToJson(QrObj data) => json.encode(data.toJson());

class QrObj {
  QrObj(
      {this.cardNo,
      this.idNo,
      this.balance,
      this.person,
      this.transId,
      this.transActive});

  String cardNo;
  String idNo;
  String balance;
  String person;
  String transId;
  bool transActive;

  factory QrObj.fromJson(Map<String, dynamic> json, String tranId) => QrObj(
      cardNo: json["cardNo"],
      idNo: json["idNo"],
      balance: json["balance"],
      transId: tranId,
      person: json["person"],
      transActive: json["transActive"]);

  Map<String, dynamic> toJson() =>
      {"cardNo": cardNo, "idNo": idNo, "balance": balance, "Person": person};
}
