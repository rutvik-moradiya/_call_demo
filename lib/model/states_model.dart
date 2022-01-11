// To parse this JSON data, do
//
//     final statesName = statesNameFromJson(jsonString);

import 'dart:convert';


class StatesNames {
  StatesNames({
    this.states,
    this.ttl,
  });

  List<dynamic>? states;
  int? ttl;

  factory StatesNames.fromJson(Map<String, dynamic> json) {
    return StatesNames(
      states: parseStates(json['states']).toList(),
      ttl: json['ttl'] as int,
      );
  }

  static List<States> parseStates(placesJson) {
    List<States> slist = List<States>.from(placesJson);
    return slist;
  }
}

class States {
  States({
    this.stateId,
    this.stateName,
  });

  int? stateId;
  String? stateName;

  factory States.fromJson(Map<String, dynamic> json) => States(
    stateId: json["state_id"],
    stateName: json["state_name"],
  );

  Map<String, dynamic> toJson() => {
    "state_id": stateId,
    "state_name": stateName,
  };
}
