// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      condition: json['condition'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      usedFor: json['usedFor'] as String?,
      availability: json['availability'] as bool?,
      delivery: json['delivery'] as bool?,
      negotiation: json['negotiation'] as bool?,
      prdid: json['_id'] as String?,
    );

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      '_id': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'negotiation': instance.negotiation,
      'availability': instance.availability,
      'address': instance.address,
      'delivery': instance.delivery,
      'condition': instance.condition,
      'usedFor': instance.usedFor,
      'category': instance.category,
    };
