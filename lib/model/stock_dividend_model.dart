// To parse this JSON data, do
//
//     final stockDividend = stockDividendFromJson(jsonString);

import 'dart:convert';

StockDividend stockDividendFromJson(String str) => StockDividend.fromJson(json.decode(str));

String stockDividendToJson(StockDividend data) => json.encode(data.toJson());

class StockDividend {
  StockDividend({
    this.status,
    this.count,
    this.results,
  });

  String? status;
  int? count;
  List<Result>? results;

  factory StockDividend.fromJson(Map<String, dynamic> json) => StockDividend(
    status: json["status"],
    count: json["count"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.ticker,
    this.exDate,
    this.paymentDate,
    this.recordDate,
    this.amount,
    this.declaredDate,
  });

  Ticker? ticker;
  DateTime? exDate;
  DateTime? paymentDate;
  DateTime? recordDate;
  double? amount;
  DateTime? declaredDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    ticker: tickerValues.map![json["ticker"]],
    exDate: DateTime.parse(json["exDate"]),
    paymentDate: DateTime.parse(json["paymentDate"]),
    recordDate: DateTime.parse(json["recordDate"]),
    amount: json["amount"].toDouble(),
    declaredDate: json["declaredDate"] == null ? null : DateTime.parse(json["declaredDate"]),
  );

  Map<String, dynamic> toJson() => {
    "ticker": tickerValues.reverse[ticker],
    "exDate": "${exDate!.year.toString().padLeft(4, '0')}-${exDate!.month.toString().padLeft(2, '0')}-${exDate!.day.toString().padLeft(2, '0')}",
    "paymentDate": "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
    "recordDate": "${recordDate!.year.toString().padLeft(4, '0')}-${recordDate!.month.toString().padLeft(2, '0')}-${recordDate!.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "declaredDate": declaredDate == null ? null : "${declaredDate!.year.toString().padLeft(4, '0')}-${declaredDate!.month.toString().padLeft(2, '0')}-${declaredDate!.day.toString().padLeft(2, '0')}",
  };
}

enum Ticker { AAPL }

final tickerValues = EnumValues({
  "AAPL": Ticker.AAPL
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
