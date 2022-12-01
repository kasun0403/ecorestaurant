import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:ecoresturant/services/model/item_unit_type_model.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final String id;
  final String? name;
  final String? image;
  @JsonKey(name: 'category_id')
  final String categoryId;
  @JsonKey(name: 'categoty_name')
  final String categotyName;
  final double? price;
  final List<UnitType?>? unitType;
  final String? description;
  ItemModel({
    required this.id,
    this.name,
    this.image,
    required this.categoryId,
    required this.categotyName,
    this.price,
    this.unitType,
    this.description,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
