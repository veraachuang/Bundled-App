import 'package:cloud_firestore/cloud_firestore.dart';
import 'address.dart';

class Ngo {
  String? id;
  String ngoName;
  List<Address> ngoAddress;
  String ngoEmail;
  String ngoPhone;
  String ngoImg;
  List<String> ngoDescription;
  String ngoSite;
  String ngoPix;

  Ngo({
    this.id,
    required this.ngoName,
    required this.ngoAddress,
    required this.ngoEmail,
    required this.ngoPhone,
    required this.ngoImg,
    required this.ngoDescription,
    required this.ngoSite,
    required this.ngoPix,
  });

  /* static Ngo fromSnapshot(DocumentSnapshot snap) {
    Ngo ngo = Ngo(
      id: snap['_id'],
      ngoName: snap['ngoName'],
      ngoAddress: snap['ngoAddress'],
      ngoEmail: snap['ngoEmail'],
      ngoPhone: snap['ngoPhone'],
      ngoImg: snap['ngoImg'],
      ngoDescription: snap['ngoDescription'],
      ngoSite: snap['ngoSite'],
      ngoPix: snap['ngoPix'],
    );
    return ngo;
  } */

  /* factory Ngo.fromMap(Map<String, dynamic> data) {
    return Ngo(
      id: data['_id'],
      ngoName: data['ngoName'],
      ngoAddress: data['ngoAddress'],
      ngoEmail: data['ngoEmail'],
      ngoPhone: data['ngoPhone'],
      ngoImg: data['ngoImg'],
      ngoDescription: data['ngoDescription'],
      ngoSite: data['ngoSite'],
      ngoPix: data['ngoPix'],
    );
  } */

  /* factory Ngo.fromMap(Map<String, dynamic> data) {
    id = 
    data['_id'];
    ngoName = 
    data['ngoName'];
    ngoAddress = 
    data['ngoAddress'];
    ngoEmail =
    data['ngoEmail'];
    ngoPhone =
    data['ngoPhone'];
    ngoImg =
    data['ngoImg'];
    ngoDescription =
    data['ngoDescription'];
    ngoSite =
    data['ngoSite'];
    ngoPix =
    data['ngoPix'];
  } */

  /* factory Ngo.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Ngo(
      id: doc.id,
      ngoName: doc.data()!['ngoName'],
      ngoAddress: doc.data()!['ngoAddress'],
      ngoDescription: doc.data()?['ngoDescription'] == null
          ? null
          : doc.data()?['ngoDescription'].cast<String>(),
      ngoEmail: doc.data()!['ngoEmail'],
      ngoImg: doc.data()!['ngoImg'],
      ngoPhone: doc.data()!['ngoPhone'],
      ngoPix: doc.data()!['ngoPix'],
      ngoSite: doc.data()!['ngoSite'],
    );
  } */

  //Firestore
  Ngo.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  )   : ngoName = snapshot.data()?['ngoName'],
        ngoAddress = snapshot.data()?['ngoAddress'],
        ngoDescription = snapshot.data()?['ngoDescription'],
        ngoEmail = snapshot.data()?['ngoEmail'],
        ngoImg = snapshot.data()?['ngoImg'],
        ngoPhone = snapshot.data()?['ngoPhone'],
        ngoPix = snapshot.data()?['ngoPix'],
        ngoSite = snapshot.data()?['ngoSite'];

  Map<String, dynamic> toFirestore() {
    return {
      if(ngoName != null) "ngoName":ngoName,
      if(ngoAddress != null) "ngoAddress":ngoAddress,
      if(ngoDescription != null) "ngoDescription":ngoDescription,
      if(ngoEmail != null) "ngoEmail":ngoEmail,
      if(ngoImg != null) "ngoImg":ngoImg,
      if(ngoPhone != null) "ngoPhone":ngoPhone,
      if(ngoPix != null) "ngoPix":ngoPix,
      if(ngoSite != null) "ngoName":ngoSite,
    };
  }
  //firestore

  factory Ngo.fromSnapshot(DocumentSnapshot snapshot) {
    final newNgo = Ngo.fromJson(snapshot.data() as Map<String, dynamic>);
    newNgo.id = snapshot.id;
    return newNgo;
  }

  factory Ngo.fromJson(Map<String, dynamic> json) => _ngoFromJson(json);

  Map<String, dynamic> toJson() => _ngoToJson(this);
}

//outside of class
Ngo _ngoFromJson(Map<String, dynamic> json) {
  return Ngo(
    id: json['_id'],
    ngoName: json['ngoName'],
    ngoAddress: _convertAddress(json['ngoAddress'] as List<dynamic>),
    ngoEmail: json['ngoEmail'],
    ngoPhone: json['ngoPhone'],
    ngoImg: json['ngoImg'],
    ngoDescription: json['ngoDescription'],
    ngoSite: json['ngoSite'],
    ngoPix: json['ngoPix'],
  );
}

List<Address> _convertAddress(List<dynamic> addressMap) {
  final addresses = <Address>[];

  for (final address in addressMap) {
    addresses.add(Address.fromJson(address as Map<String, dynamic>));
  }
  return addresses;
}

Map<String, dynamic> _ngoToJson(Ngo instance) => <String, dynamic>{
      'ngoName': instance.ngoName,
      'ngoAddress': _addressList(instance.ngoAddress),
      'ngoDescription': instance.ngoDescription,
      'ngoEmail': instance.ngoEmail,
      'ngoImg': instance.ngoImg,
      'ngoPhone': instance.ngoPhone,
      'ngoPix': instance.ngoPix,
      'ngoSite': instance.ngoSite,
    };

List<Map<String, dynamic>>? _addressList(List<Address>? addresses) {
  if (addresses == null) {
    return null;
  }
  final addressMap = <Map<String, dynamic>>[];
  addresses.forEach((address) {
    addressMap.add(address.toJson());
  });
  return addressMap;
}
