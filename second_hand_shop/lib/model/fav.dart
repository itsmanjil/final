import 'package:json_annotation/json_annotation.dart';

part 'fav.g.dart';

@JsonSerializable()
class Fav {
  // @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  String? image;
  String? category;
  double? price;
  bool? negotiation;
  bool? availability;
  // String? owner_id;
  // String? address;
  bool? delivery;
  String? condition;
  String? usedFor;
  List? favid;

  Fav({
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
    // this.owner_id,
  });

//flutter pub run build_runner build
  factory Fav.fromJson(Map<String, dynamic> json) {
    return _$FavFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavToJson(this);
}
