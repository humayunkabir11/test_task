import 'package:fpdart/src/either.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/usecase/chat_usecase.dart';
import '../datasources/chat_remote_data_source.dart';
import '../../../../core/common/models/success_response.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteSource;
  final ConnectionChecker connectionChecker;

  ChatRepositoryImpl({
    required this.remoteSource,
    required this.connectionChecker,
  });


}
