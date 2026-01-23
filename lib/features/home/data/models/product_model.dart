import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "short_name")
  final String? shortName;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "thumb_image")
  final String? thumbImage;
  @JsonKey(name: "qty")
  final int? qty;
  @JsonKey(name: "sold_qty")
  final int? soldQty;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "offer_price")
  final double? offerPrice;
  @JsonKey(name: "is_undefine")
  final int? isUndefine;
  @JsonKey(name: "is_featured")
  final int? isFeatured;
  @JsonKey(name: "new_product")
  final int? newProduct;
  @JsonKey(name: "is_top")
  final int? isTop;
  @JsonKey(name: "is_best")
  final int? isBest;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "sub_category_id")
  final int? subCategoryId;
  @JsonKey(name: "child_category_id")
  final int? childCategoryId;
  @JsonKey(name: "brand_id")
  final int? brandId;
  @JsonKey(name: "averageRating")
  final String? averageRating;
  @JsonKey(name: "totalSold")
  final dynamic totalSold;
  @JsonKey(name: "active_variants")
  final List<ActiveVariant>? activeVariants;

  ProductModel({
    this.id,
    this.name,
    this.shortName,
    this.slug,
    this.thumbImage,
    this.qty,
    this.soldQty,
    this.price,
    this.offerPrice,
    this.isUndefine,
    this.isFeatured,
    this.newProduct,
    this.isTop,
    this.isBest,
    this.categoryId,
    this.subCategoryId,
    this.childCategoryId,
    this.brandId,
    this.averageRating,
    this.totalSold,
    this.activeVariants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ActiveVariant {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "active_variant_items")
  final List<ActiveVariantItem>? activeVariantItems;

  ActiveVariant({
    this.id,
    this.name,
    this.productId,
    this.activeVariantItems,
  });

  factory ActiveVariant.fromJson(Map<String, dynamic> json) => _$ActiveVariantFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveVariantToJson(this);
}

@JsonSerializable()
class ActiveVariantItem {
  @JsonKey(name: "product_variant_id")
  final int? productVariantId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "id")
  final int? id;

  ActiveVariantItem({
    this.productVariantId,
    this.name,
    this.price,
    this.id,
  });

  factory ActiveVariantItem.fromJson(Map<String, dynamic> json) => _$ActiveVariantItemFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveVariantItemToJson(this);
}