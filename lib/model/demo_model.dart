// To parse this JSON data, do
//
//     final demoPost = demoPostFromJson(jsonString);

import 'dart:convert';

List<DemoPost> demoPostFromJson(String str) => List<DemoPost>.from(json.decode(str).map((x) => DemoPost.fromJson(x)));

String demoPostToJson(List<DemoPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemoPost {
  DemoPost({
    this.id,
    this.name,
    this.manufacturer,
  });

  String? id;
  String? name;
  Manufacturer? manufacturer;

  factory DemoPost.fromJson(Map<String, dynamic> json) => DemoPost(
    id: json["id"],
    name: json["name"],
    manufacturer: Manufacturer.fromJson(json["manufacturer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "manufacturer": manufacturer!.toJson(),
  };
}

class Manufacturer {
  Manufacturer({
    this.name,
    this.homePage,
    this.phone,
  });

  String? name;
  String? homePage;
  String? phone;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
    name: json["name"],
    homePage: json["homePage"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "homePage": homePage,
    "phone": phone,
  };
}
