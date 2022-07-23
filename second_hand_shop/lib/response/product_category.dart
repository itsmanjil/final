import 'package:json_annotation/json_annotation.dart';

import '../model/category.dart';
part 'product_category.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class ProductCategory {
  // @JsonKey(id: '_id')
  // String? id;
  String? name;
  String? description;
  String? image;
  double? price;
  bool? negotiation;
  bool? availability;
  String? owner_id;
  String? address;
  bool? delivery;
  String? condition;
  String? usedFor;
  String? prdid;

  Category? category;

  ProductCategory(
      {this.name,
      this.description,
      this.address,
      this.image,
      this.condition,
      this.price,
      this.category,
      this.usedFor,
      this.availability,
      this.delivery,
      this.negotiation,
      this.owner_id,
      this.prdid});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
