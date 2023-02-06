// To parse this JSON data, do
//
//     final saleDetailModel = saleDetailModelFromJson(jsonString);

import 'dart:convert';

SaleDetailModel saleDetailModelFromJson(String str) => SaleDetailModel.fromJson(json.decode(str));

String saleDetailModelToJson(SaleDetailModel data) => json.encode(data.toJson());

class SaleDetailModel {
  SaleDetailModel({
    this.idProduct,
    this.idSaleNote,
    this.quantity,
    this.priceSale,
  });

  String? idProduct;
  String? idSaleNote;
  int? quantity;
  double? priceSale;

  factory SaleDetailModel.fromJson(Map<String, dynamic> json) => SaleDetailModel(
    idProduct: json["idProduct"],
    idSaleNote: json["idSaleNote"],
    quantity: json["quantity"],
    priceSale: json["priceSale"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "idProduct": idProduct,
    "idSaleNote": idSaleNote,
    "quantity": quantity,
    "priceSale": priceSale,
  };
}
