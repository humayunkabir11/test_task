import 'package:json_annotation/json_annotation.dart';
part 'home_page_category.g.dart';
@JsonSerializable()
class HomepageCategory {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "image")
  final String? image;

  HomepageCategory({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.image,
  });

  factory HomepageCategory.fromJson(Map<String, dynamic> json) => _$HomepageCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$HomepageCategoryToJson(this);
}