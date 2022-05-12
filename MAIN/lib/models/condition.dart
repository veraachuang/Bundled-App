class Condition {
  bool? value;
  String title;
  
  Condition({
    this.value,
    required this.title});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _conditionFromJson(json);

  Map<String, dynamic> toJson() => _conditionToJson(this);
}
//outside class

Condition _conditionFromJson(Map<String, dynamic> json) {
  return Condition(
    //value: json['value'],
    title: json['title']);
}

Map<String, dynamic> _conditionToJson(Condition instance) => <String, dynamic>{
      //'value': instance.value,
      'title': instance.title,
    };
