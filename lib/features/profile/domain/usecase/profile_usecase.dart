import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/profile_repository.dart';
import '../../data/models/profile_response.dart';


class ProfileUseCase implements UseCase<ProfileResponse, GetProfileParams> {
  final ProfileRepository? profileRepository;
  ProfileUseCase({this.profileRepository});
  @override
  Future<Either<Failure, ProfileResponse>> call(GetProfileParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class GetProfileParams{
  final String? path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;

  GetProfileParams({
    this.path,
    this.query,
    this.body,
  });
}