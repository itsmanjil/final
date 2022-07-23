// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      condition: json['condition'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] as String?,
      usedFor: json['usedFor'] as String?,
      availability: json['availability'] as bool?,
      delivery: json['delivery'] as bool?,
      negotiation: json['negotiation'] as bool?,
      owner_id: json['owner_id'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      // 'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
      'price': instance.price,
      'negotiation': instance.negotiation,
      'availability': instance.availability,
      'owner_id': instance.owner_id,
      'delivery': instance.delivery,
      'condition': instance.condition,
      'usedFor': instance.usedFor,
    };
