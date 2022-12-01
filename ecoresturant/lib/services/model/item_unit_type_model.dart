import 'package:json_annotation/json_annotation.dart';

part 'item_unit_type_model.g.dart';

@JsonSerializable()
class UnitType {
  UnitType({
    required this.name,
    required this.value,
    required this.price,
  });

  final String name;
  final String value;
  final int price;

  factory UnitType.fromJson(Map<String, dynamic> json) =>
      _$UnitTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UnitTypeToJson(this);
}
