// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      categoryId: json['category_id'] as String,
      categotyName: json['categoty_name'] as String,
      price: (json['price'] as num?)?.toDouble(),
      unitType: (json['unitType'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : UnitType.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'category_id': instance.categoryId,
      'categoty_name': instance.categotyName,
      'price': instance.price,
      'unitType': instance.unitType,
      'description': instance.description,
    };
