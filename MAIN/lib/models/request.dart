import 'package:cloud_firestore/cloud_firestore.dart';

import 'condition.dart';

class Request {
  String? id;
  String itemName;
  int? quantity;
  List<Condition> condition;
  String category;

  Request({
    this.id,
    required this.itemName,
    required this.quantity,
    required this.condition,
    required this.category,
  });

  factory Request.fromSnapshot(DocumentSnapshot snapshot) {
    final newrequest =
        Request.fromJson(snapshot.data() as Map<String, dynamic>);
    newrequest.id = snapshot.id;
    return newrequest;
  }

  factory Request.fromJson(Map<String, dynamic> json) => _requestFromJson(json);

  Map<String, dynamic> toJson() => _requestToJson(this);
}
//outside class

Request _requestFromJson(Map<String, dynamic> json) {
  return Request(
      id: json['_id'],
      itemName: json['itemName'],
      quantity: json['quantity'],
      condition: _convertCondition(json['condition'] as List<dynamic>),
      category: json['category']);
}

List<Condition> _convertCondition(List<dynamic> conditionMap) {
  final conditions = <Condition>[];

  for (final condition in conditionMap) {
    conditions.add(Condition.fromJson(condition as Map<String, dynamic>));
  }
  return conditions;
}

Map<String, dynamic> _requestToJson(Request instance) => <String, dynamic>{
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'condition': _conditionList(instance.condition),
      'category': instance.category,
    };
    
List<Map<String, dynamic>>? _conditionList(List<Condition>? conditions) {
  if (conditions == null) {
    return null;
  }
  final conditionMap = <Map<String, dynamic>>[];
  conditions.forEach((condition) {
    conditionMap.add(condition.toJson());
  });
  return conditionMap;
}