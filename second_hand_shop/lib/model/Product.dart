import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product {
  // @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  String? image;
  String? category;
  double? price;
  bool? negotiation;
  bool? availability;
  String? owner_id;
  // String? address;
  bool? delivery;
  String? condition;
  String? usedFor;

  Product({
    // this.id,
    this.name,
    this.description,
    // this.address,
    this.image,
    this.condition,
    this.price,
    this.category,
    this.usedFor,
    this.availability,
    this.delivery,
    this.negotiation,
    this.owner_id,
  });

//flutter pub run build_runner build
  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
