
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../models/home_data-response_model.dart';
import '../models/product_list_response_model.dart';
import '../models/product_details_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataResponseModel> getHomeData();
  Future<ProductListResponseModel> getProducts({
    int page = 1,
    String? search,
    int? categoryId,
  });
  Future<ProductDetailsResponseModel> getProductDetails(String slug);
}

class HomeRemoteSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteSourceImpl({required this.apiClient});

  @override
  Future<HomeDataResponseModel> getHomeData() async {
    try {
      final result = await apiClient.get(
        api: 'https://mamunuiux.com/flutter_task/api',
      );
      return HomeDataResponseModel.fromJson(result.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ProductListResponseModel> getProducts({
    int page = 1,
    String? search,
    int? categoryId,
  }) async {
    try {
      if (categoryId != null) {
        final result = await apiClient.get(
          api: 'https://mamunuiux.com/flutter_task/api/product-by-category/$categoryId',
        );
        // Map category API response to ProductListResponseModel structure
        final List<dynamic> productsJson = result.data['products'] ?? [];
        final products = productsJson
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return ProductListResponseModel(
            products: ProductDataModel(
          currentPage: 1,
          lastPage: 1,
          total: products.length,
          data: products,
        ));
      } else {
        final Map<String, dynamic> queryParams = {'page': page};
        if (search != null && search.isNotEmpty) {
          queryParams['search'] = search;
        }

        final result = await apiClient.get(
          api: 'https://mamunuiux.com/flutter_task/api/product',
          params: queryParams,
        );
        return ProductListResponseModel.fromJson(result.data);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ProductDetailsResponseModel> getProductDetails(String slug) async {
    try {
      final result = await apiClient.get(
        api: 'https://mamunuiux.com/flutter_task/api/product/$slug',
      );
      return ProductDetailsResponseModel.fromJson(result.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}