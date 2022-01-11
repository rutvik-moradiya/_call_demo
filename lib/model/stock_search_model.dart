// To parse this JSON data, do
//
//     final stockSearch = stockSearchFromJson(jsonString);

import 'dart:convert';

StockSearch stockSearchFromJson(String str) => StockSearch.fromJson(json.decode(str));

String stockSearchToJson(StockSearch data) => json.encode(data.toJson());

class StockSearch {
  StockSearch({
    this.bestMatches,
  });

  List<BestMatch>? bestMatches;

  factory StockSearch.fromJson(Map<String, dynamic> json) => StockSearch(
    bestMatches: List<BestMatch>.from(json["bestMatches"].map((x) => BestMatch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bestMatches": List<dynamic>.from(bestMatches!.map((x) => x.toJson())),
  };
}

class BestMatch {
  BestMatch({
    this.the1Symbol,
    this.the2Name,
    this.the3Type,
    this.the4Region,
    this.the5MarketOpen,
    this.the6MarketClose,
    this.the7Timezone,
    this.the8Currency,
    this.the9MatchScore,
  });

  String? the1Symbol;
  String? the2Name;
  String? the3Type;
  String? the4Region;
  String? the5MarketOpen;
  String? the6MarketClose;
  String? the7Timezone;
  String? the8Currency;
  String? the9MatchScore;

  factory BestMatch.fromJson(Map<String, dynamic> json) => BestMatch(
    the1Symbol: json["1. symbol"],
    the2Name: json["2. name"],
    the3Type: json["3. type"],
    the4Region: json["4. region"],
    the5MarketOpen: json["5. marketOpen"],
    the6MarketClose: json["6. marketClose"],
    the7Timezone: json["7. timezone"],
    the8Currency: json["8. currency"],
    the9MatchScore: json["9. matchScore"],
  );

  Map<String, dynamic> toJson() => {
    "1. symbol": the1Symbol,
    "2. name": the2Name,
    "3. type": the3Type,
    "4. region": the4Region,
    "5. marketOpen": the5MarketOpen,
    "6. marketClose": the6MarketClose,
    "7. timezone": the7Timezone,
    "8. currency": the8Currency,
    "9. matchScore": the9MatchScore,
  };
}
