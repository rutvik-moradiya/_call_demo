// To parse this JSON data, do
//
//     final nameJob = nameJobFromJson(jsonString);

import 'dart:convert';

NameJob nameJobFromJson(String str) => NameJob.fromJson(json.decode(str));

String nameJobToJson(NameJob data) => json.encode(data.toJson());

class NameJob {
  NameJob({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String? name;
  String? job;
  String? id;
  DateTime? createdAt;

  factory NameJob.fromJson(Map<String, dynamic> json) => NameJob(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt!.toIso8601String(),
  };
}
