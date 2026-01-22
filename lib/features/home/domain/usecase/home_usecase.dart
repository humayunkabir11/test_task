import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';
import '../../data/models/home_response.dart';


class HomeUseCase implements UseCase<HomeResponse, GetHomeParams> {
  final HomeRepository? homeRepository;
  HomeUseCase({this.homeRepository});
  @override
  Future<Either<Failure, HomeResponse>> call(GetHomeParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class GetHomeParams{
  final String? path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;

  GetHomeParams({
    this.path,
    this.query,
    this.body,
  });
}