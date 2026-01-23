
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/home_data-response_model.dart';
import '../../data/models/product_details_response_model.dart';
import '../../data/models/product_list_response_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeDataResponseModel>> getHomeData();
  Future<Either<Failure, ProductListResponseModel>> getProducts({
    int page = 1,
    String? search,
    int? categoryId,
  });
  Future<Either<Failure, ProductDetailsResponseModel>> getProductDetails(String slug);
}
