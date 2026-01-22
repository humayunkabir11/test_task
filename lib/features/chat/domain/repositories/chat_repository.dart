import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/chat/inbox_data.dart';
import '../usecase/chat_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class ChatRepository {
  Future<Either<Failure, ApiResponse<List<InboxData>>>> getConversations(GetChatParams params);
}
