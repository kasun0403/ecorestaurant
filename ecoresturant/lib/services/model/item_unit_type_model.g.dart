// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_unit_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitType _$UnitTypeFromJson(Map<String, dynamic> json) => UnitType(
      name: json['name'] as String,
      value: json['value'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$UnitTypeToJson(UnitType instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'price': instance.price,
    };
