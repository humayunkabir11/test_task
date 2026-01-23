// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data-response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



HomeDataResponseModel _$HomeDataResponseModelFromJson(
  Map<String, dynamic> json,
) => HomeDataResponseModel(
  homepageCategories: (json['homepage_categories'] as List<dynamic>?)
      ?.map((e) => HomepageCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  newArrivalProducts: (json['newArrivalProducts'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeDataResponseModelToJson(
  HomeDataResponseModel instance,
) => <String, dynamic>{
  'homepage_categories': instance.homepageCategories,
  'newArrivalProducts': instance.newArrivalProducts,
};
