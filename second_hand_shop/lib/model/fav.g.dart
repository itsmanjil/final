// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fav _$FavFromJson(Map<String, dynamic> json) => Fav(
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
    )
      ..id = json['id'] as String?
      ..favid = json['favid'] as List<dynamic>?;

Map<String, dynamic> _$FavToJson(Fav instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
      'price': instance.price,
      'negotiation': instance.negotiation,
      'availability': instance.availability,
      'delivery': instance.delivery,
      'condition': instance.condition,
      'usedFor': instance.usedFor,
      'favid': instance.favid,
    };
