import 'package:fpdart/src/either.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/usecase/chat_usecase.dart';
import '../datasources/chat_remote_data_source.dart';
import '../../../../core/common/models/success_response.dart';
import '../models/chat/inbox_data.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteSource;
  final ConnectionChecker connectionChecker;

  ChatRepositoryImpl({
    required this.remoteSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, ApiResponse<List<InboxData>>>> getConversations(
    GetChatParams params,
  ) async {
    // TODO: implement login
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(message: "no internet connection!!"));
      } else {
        final data = await remoteSource.getConversations(params);
        if (!data.status) {
          return left(Failure(message: data.message ?? "Something went wrong"));
        } else {
          return right(data);
        }
      }
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: "Something went wrong"));
    }
  }
}
