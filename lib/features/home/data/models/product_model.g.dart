// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  shortName: json['short_name'] as String?,
  slug: json['slug'] as String?,
  thumbImage: json['thumb_image'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  soldQty: (json['sold_qty'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  offerPrice: (json['offer_price'] as num?)?.toDouble(),
  isUndefine: (json['is_undefine'] as num?)?.toInt(),
  isFeatured: (json['is_featured'] as num?)?.toInt(),
  newProduct: (json['new_product'] as num?)?.toInt(),
  isTop: (json['is_top'] as num?)?.toInt(),
  isBest: (json['is_best'] as num?)?.toInt(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  subCategoryId: (json['sub_category_id'] as num?)?.toInt(),
  childCategoryId: (json['child_category_id'] as num?)?.toInt(),
  brandId: (json['brand_id'] as num?)?.toInt(),
  averageRating: json['averageRating'] as String?,
  totalSold: json['totalSold'],
  activeVariants: (json['active_variants'] as List<dynamic>?)
      ?.map((e) => ActiveVariant.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_name': instance.shortName,
      'slug': instance.slug,
      'thumb_image': instance.thumbImage,
      'qty': instance.qty,
      'sold_qty': instance.soldQty,
      'price': instance.price,
      'offer_price': instance.offerPrice,
      'is_undefine': instance.isUndefine,
      'is_featured': instance.isFeatured,
      'new_product': instance.newProduct,
      'is_top': instance.isTop,
      'is_best': instance.isBest,
      'category_id': instance.categoryId,
      'sub_category_id': instance.subCategoryId,
      'child_category_id': instance.childCategoryId,
      'brand_id': instance.brandId,
      'averageRating': instance.averageRating,
      'totalSold': instance.totalSold,
      'active_variants': instance.activeVariants,
    };

ActiveVariant _$ActiveVariantFromJson(Map<String, dynamic> json) =>
    ActiveVariant(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      productId: (json['product_id'] as num?)?.toInt(),
      activeVariantItems: (json['active_variant_items'] as List<dynamic>?)
          ?.map((e) => ActiveVariantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActiveVariantToJson(ActiveVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_id': instance.productId,
      'active_variant_items': instance.activeVariantItems,
    };

ActiveVariantItem _$ActiveVariantItemFromJson(Map<String, dynamic> json) =>
    ActiveVariantItem(
      productVariantId: (json['product_variant_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActiveVariantItemToJson(ActiveVariantItem instance) =>
    <String, dynamic>{
      'product_variant_id': instance.productVariantId,
      'name': instance.name,
      'price': instance.price,
      'id': instance.id,
    };
