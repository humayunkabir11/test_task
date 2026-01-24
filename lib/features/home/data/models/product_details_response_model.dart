
import 'package:equatable/equatable.dart';
import 'home_data-response_model.dart';

class ProductDetailsResponseModel extends Equatable {
  final ProductDetailModel? product;
  final List<ProductModel>? relatedProducts;
  final List<GalleryModel>? gellery;

  const ProductDetailsResponseModel({
    this.product,
    this.relatedProducts,
    this.gellery,
  });

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponseModel(
      product: json['product'] != null
          ? ProductDetailModel.fromJson(json['product'] as Map<String, dynamic>)
          : null,
      relatedProducts: (json['relatedProducts'] as List?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gellery: (json['gellery'] as List?)
          ?.map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [product, relatedProducts, gellery];
}

class GalleryModel extends Equatable {
  final int? id;
  final int? productId;
  final String? image;

  const GalleryModel({this.id, this.productId, this.image});

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      image: json['image'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, productId, image];
}

class ProductDetailModel extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? thumbImage;
  final dynamic price;
  final dynamic offerPrice;
  final String? shortDescription;
  final String? longDescription;
  final String? averageRating;
  final dynamic totalSold; // Can be string or int based on JSON
  final int? qty;
  final List<ActiveVariant>? activeVariants;
  final Brand? brand;

  const ProductDetailModel({
    this.id,
    this.name,
    this.slug,
    this.thumbImage,
    this.price,
    this.offerPrice,
    this.shortDescription,
    this.longDescription,
    this.averageRating,
    this.totalSold,
    this.qty,
    this.activeVariants,
    this.brand,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      thumbImage: json['thumb_image'] as String?,
      price: json['price'],
      offerPrice: json['offer_price'],
      shortDescription: json['short_description'] as String?,
      longDescription: json['long_description'] as String?,
      averageRating: json['averageRating']?.toString(), // Handle potential types
      totalSold: json['totalSold'],
      qty: json['qty'] is int ? json['qty'] : int.tryParse(json['qty'].toString()),
      activeVariants: (json['active_variants'] as List?)
          ?.map((e) => ActiveVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,  
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        thumbImage,
        price,
        offerPrice,
        shortDescription,
        longDescription,
        averageRating,
        totalSold,
        qty,
        activeVariants,
        brand,
      ];
}

class ActiveVariant extends Equatable {
  final int? id;
  final String? name;
  final List<ActiveVariantItem>? activeVariantItems;

  const ActiveVariant({this.id, this.name, this.activeVariantItems});

  factory ActiveVariant.fromJson(Map<String, dynamic> json) {
    return ActiveVariant(
      id: json['id'] as int?,
      name: json['name'] as String?,
      activeVariantItems: (json['active_variant_items'] as List?)
          ?.map((e) => ActiveVariantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, name, activeVariantItems];
}

class ActiveVariantItem extends Equatable {
  final int? id;
  final String? name;
  final dynamic price;

  const ActiveVariantItem({this.id, this.name, this.price});

  factory ActiveVariantItem.fromJson(Map<String, dynamic> json) {
    return ActiveVariantItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'],
    );
  }

  @override
  List<Object?> get props => [id, name, price];
}

class Brand extends Equatable {
    final int? id;
    final String? name;
    final String? logo;

    const Brand({this.id, this.name, this.logo});

    factory Brand.fromJson(Map<String, dynamic> json) {
        return Brand(
            id: json['id'],
            name: json['name'],
            logo: json['logo'],
        );
    }
    
    @override
    List<Object?> get props => [id, name, logo];
}
