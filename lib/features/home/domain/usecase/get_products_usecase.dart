
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/product_list_response_model.dart';
import '../repositories/home_repository.dart';

class GetProductsUseCase implements UseCase<ProductListResponseModel, GetProductsParams> {
  final HomeRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, ProductListResponseModel>> call(GetProductsParams params) async {
    return await repository.getProducts(
      page: params.page,
      search: params.search,
      categoryId: params.categoryId,
    );
  }
}

class GetProductsParams {
  final int page;
  final String? search;
  final int? categoryId;

  GetProductsParams({
    this.page = 1,
    this.search,
    this.categoryId,
  });
}
