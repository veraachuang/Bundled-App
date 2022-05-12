import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  String? buildingName;
  String? streetName;
  String? cityName;

  Address({this.buildingName, this.streetName, this.cityName});

  /* static Address fromSnapshot(DocumentSnapshot snap) {
    Address address = Address(
      buildingName: snap['buildingName'],
      streetName: snap['streetName'],
      cityName: snap['cityName'],
    );
    return address;
  } */

  factory Address.fromJson(Map<String, dynamic> json) => _addressFromJson(json);

  Map<String, dynamic> toJson() => _addressToJson(this);

  /* static List<Address> fromJsonArray(List<dynamic> jsonAddress) {
    List<Address> address = [];

    jsonAddress.forEach((jsonData) {
      address.add(Address.fromJson(jsonData));
    });

    return address;
  } */
}

Address _addressFromJson(Map<String, dynamic> json) {
  return Address(
    buildingName: json['buildingName'],
    streetName: json['streetName'],
    cityName: json['cityName'],
  );
}

Map<String, dynamic> _addressToJson(Address instance) => <String, dynamic>{
      'buildingName': instance.buildingName,
      'streetName': instance.streetName,
      'cityName': instance.cityName,
    };
