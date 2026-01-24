import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/chat_response.dart';
import '../repositories/chat_repository.dart';


class ChatUseCase implements UseCase<ChatResponse, GetChatParams> {
  final ChatRepository? chatRepository;
  ChatUseCase({this.chatRepository});

  @override
  Future<Either<Failure, ChatResponse>> call(GetChatParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class GetChatParams {
  final String? path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;

  GetChatParams({this.path, this.query, this.body});
}
