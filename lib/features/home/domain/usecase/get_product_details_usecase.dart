
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/product_details_response_model.dart';
import '../repositories/home_repository.dart';

class GetProductDetailsUseCase
    implements UseCase<ProductDetailsResponseModel, String> {
  final HomeRepository repository;

  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ProductDetailsResponseModel>> call(String params) async {
    return await repository.getProductDetails(params);
  }
}
