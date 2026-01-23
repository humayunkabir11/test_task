// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomepageCategory _$HomepageCategoryFromJson(Map<String, dynamic> json) =>
    HomepageCategory(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      icon: json['icon'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$HomepageCategoryToJson(HomepageCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'icon': instance.icon,
      'image': instance.image,
    };
