// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:testing/features/home/data/models/product_list_response_model.dart';

part of 'product_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


ProductListResponseModel _$ProductListResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductListResponseModel(
  products: json['products'] == null
      ? null
      : Products.fromJson(json['products'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductListResponseModelToJson(
  ProductListResponseModel instance,
) => <String, dynamic>{'products': instance.products};

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
  currentPage: (json['current_page'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  firstPageUrl: json['first_page_url'] as String?,
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  lastPageUrl: json['last_page_url'] as String?,
  nextPageUrl: json['next_page_url'] as String?,
  path: json['path'] as String?,
  perPage: (json['per_page'] as num?)?.toInt(),
  prevPageUrl: json['prev_page_url'],
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.data,
  'first_page_url': instance.firstPageUrl,
  'from': instance.from,
  'last_page': instance.lastPage,
  'last_page_url': instance.lastPageUrl,
  'next_page_url': instance.nextPageUrl,
  'path': instance.path,
  'per_page': instance.perPage,
  'prev_page_url': instance.prevPageUrl,
  'to': instance.to,
  'total': instance.total,
};
