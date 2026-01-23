
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/home_data-response_model.dart';
import '../models/product_list_response_model.dart';
import '../models/product_details_response_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteSource;
  final ConnectionChecker connectionChecker;

  HomeRepositoryImpl({
    required this.remoteSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, HomeDataResponseModel>> getHomeData() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(message: "no internet connection!!"));
      }
      final data = await remoteSource.getHomeData();
      return right(data);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, ProductListResponseModel>> getProducts({
    int page = 1,
    String? search,
    int? categoryId,
  }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(message: "no internet connection!!"));
      }
      final data = await remoteSource.getProducts(
        page: page,
        search: search,
        categoryId: categoryId,
      );
      return right(data);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, ProductDetailsResponseModel>> getProductDetails(String slug) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(message: "no internet connection!!"));
      }
      final data = await remoteSource.getProductDetails(slug);
      return right(data);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: "Something went wrong"));
    }
  }
}
