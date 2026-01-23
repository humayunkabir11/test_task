
import 'package:equatable/equatable.dart';

class HomeDataResponseModel extends Equatable {
  final List<CategoryModel>? homepageCategories;
  final List<ProductModel>? newArrivalProducts;

  const HomeDataResponseModel({
    this.homepageCategories,
    this.newArrivalProducts,
  });

  factory HomeDataResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeDataResponseModel(
      homepageCategories: (json['homepage_categories'] as List?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      newArrivalProducts: (json['newArrivalProducts'] as List?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [homepageCategories, newArrivalProducts];
}

class CategoryModel extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? icon;
  final String? image;

  const CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      icon: json['icon'] as String?,
      image: json['image'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, slug, icon, image];
}

class ProductModel extends Equatable {
  final int? id;
  final String? name;
  final String? shortName;
  final String? slug;
  final String? thumbImage;
  final dynamic qty; // API sometimes returns negative numbers or strings
  final dynamic price; // Could be int, double
  final dynamic offerPrice; // Could be int, double, null

  const ProductModel({
    this.id,
    this.name,
    this.shortName,
    this.slug,
    this.thumbImage,
    this.qty,
    this.price,
    this.offerPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      shortName: json['short_name'] as String?,
      slug: json['slug'] as String?,
      thumbImage: json['thumb_image'] as String?,
      qty: json['qty'],
      price: json['price'],
      offerPrice: json['offer_price'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        shortName,
        slug,
        thumbImage,
        qty,
        price,
        offerPrice,
      ];
}