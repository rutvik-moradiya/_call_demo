class JsonData {
  String? firstName;
  String? lastName;
  String? gender;
  int? age;
  Address? address;
   final List<dynamic>? phoneNumbers;

  JsonData({
    this.firstName,
    this.lastName,
    this.gender,
    this.age,
     this.address,
      this.phoneNumbers,
  });

  factory JsonData.fromJson(Map<String, dynamic> json) {
    return JsonData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      age: json['age'] as int,
       phoneNumbers: parsePlaces(json['PhoneNumbers']).toList(),
       address: json['address'] ,
    );
  }

  static List<PhoneNumbers> parsePlaces(placesJson) {
    List<PhoneNumbers> phonelist = List<PhoneNumbers>.from(placesJson);
    return phonelist;
  }

  // static List<Address> parseAdress(addJson) {
  //   List<Address> adresslist = List<Address>.from(addJson);
  //   return adresslist;
  // }
}



class Address {
  Address({
    this.streetAddress,
    this.city,
    this.state,
    this.postalCode,
  });

  String? streetAddress;
  String? city;
  String? state;
  String? postalCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    streetAddress: json["streetAddress"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postalCode"],
  );

  Map<String, dynamic> toJson() => {
    "streetAddress": streetAddress,
    "city": city,
    "state": state,
    "postalCode": postalCode,
  };
}

class PhoneNumbers {
  PhoneNumbers({
    this.type,
    this.number,
  });

  String? type;
  String? number;

  factory PhoneNumbers.fromJson(Map<String, dynamic> json) {
    return PhoneNumbers(
      type: json['type'],
      number: json['number'],
    );
  }
}
