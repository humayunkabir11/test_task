
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/home_data-response_model.dart';
import '../repositories/home_repository.dart';

class GetHomeDataUseCase implements UseCase<HomeDataResponseModel, NoParams> {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  @override
  Future<Either<Failure, HomeDataResponseModel>> call(NoParams params) async {
    return await repository.getHomeData();
  }
}
