import 'package:flutter_donation_app/models/ngo.dart';

class Donate {
  String? id;
  String itemName = '';
  List<String> condition = [];
  String ngoName;
  String ngoImg;
  String category;

  Donate({
    this.id,
    required this.itemName,
    required this.condition,
    required this.ngoName,
    required this.ngoImg,
    required this.category,
  });
}
