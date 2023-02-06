// To parse this JSON data, do
//
//     final saleNoteModel = saleNoteModelFromJson(jsonString);

import 'dart:convert';

SaleNoteModel saleNoteModelFromJson(String str) => SaleNoteModel.fromJson(json.decode(str));

String saleNoteModelToJson(SaleNoteModel data) => json.encode(data.toJson());

class SaleNoteModel {
  SaleNoteModel({
    this.id,
    this.date,
    this.amountSale = 0.0,
    this.total = 0.0,
    this.discount = 0.0,
    this.seller,
  });

  String? id;
  DateTime? date = DateTime.now();
  double amountSale;
  double total;
  double discount;
  String? seller;

  factory SaleNoteModel.fromJson(Map<String, dynamic> json) => SaleNoteModel(
    id: json["id"],
    date: json["date"],
    amountSale: json["amount"]?.toDouble(),
    total: json["total"]?.toDouble(),
    discount: json["discount"],
    seller: json["seller"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "amount": amountSale,
    "total": total,
    "discount": discount,
    "seller": seller,
  };
}
