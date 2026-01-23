
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../models/home_data-response_model.dart';
import '../models/product_list_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataResponseModel> getHomeData();
  Future<ProductListResponseModel> getProducts({
    int page = 1,
    String? search,
    int? categoryId,
  });
}

class HomeRemoteSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteSourceImpl({required this.apiClient});

  @override
  Future<HomeDataResponseModel> getHomeData() async {
    try {
      final result = await apiClient.get(
        api: 'https://mamunuiux.com/flutter_task/api', // Using direct URL as requested/inferred
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
      // Construct query parameters
      final Map<String, dynamic> queryParams = {'page': page};
      if (search != null && search.isNotEmpty) {
        // Assuming 'search' or 'keyword' is the param. Using 'search' based on common practices.
        // User asked for "Category-wise search and keyword search".
        // I'll stick to 'search' for now, can adjust if API differs.
        queryParams['search'] = search; 
      }
      if (categoryId != null) {
        queryParams['category_id'] = categoryId;
      }

      final result = await apiClient.get(
        api: 'https://mamunuiux.com/flutter_task/api/product',
        params: queryParams,
      );
      return ProductListResponseModel.fromJson(result.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}