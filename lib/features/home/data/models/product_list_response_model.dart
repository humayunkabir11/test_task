
import 'package:equatable/equatable.dart';
import 'home_data-response_model.dart';

class ProductListResponseModel extends Equatable {
  final ProductDataModel? products;

  const ProductListResponseModel({this.products});

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductListResponseModel(
      products: json['products'] != null
          ? ProductDataModel.fromJson(json['products'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [products];
}

class ProductDataModel extends Equatable {
  final int? currentPage;
  final List<ProductModel>? data;
  final int? lastPage;
  final int? total;

  const ProductDataModel({
    this.currentPage,
    this.data,
    this.lastPage,
    this.total,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: json['last_page'] as int?,
      total: json['total'] as int?,
    );
  }

  @override
  List<Object?> get props => [currentPage, data, lastPage, total];
}
