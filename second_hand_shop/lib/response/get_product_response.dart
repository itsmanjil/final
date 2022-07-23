// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:second_hand_shop/response/product_category.dart';
part 'get_product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? success;
  List<ProductCategory>? data;

  ProductResponse({this.success, this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  get products => null;

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
