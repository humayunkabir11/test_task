

import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/config/strings/api_endpoint.dart';
import '../../../../core/network/api_response.dart';
import '../../domain/usecase/chat_usecase.dart';
import '../../../../core/common/models/success_response.dart';
import '../models/chat/inbox_data.dart';

abstract class ChatRemoteDataSource {
  Future<ApiResponse<List<InboxData>>> getConversations(GetChatParams params);
}

class ChatRemoteSourceImpl implements ChatRemoteDataSource {
  final ApiClient apiClient;
  ChatRemoteSourceImpl({required this.apiClient});

  @override
  Future<ApiResponse<List<InboxData>>> getConversations(
    GetChatParams params,
  ) async {
    // TODO: implement getConversations
    try {
      final result = await apiClient.get(
        api: ApiEndpoint.conversations,
        params: params.query ?? {},
      );
      return ApiResponse.fromJson(
        result.data,
        (json) => (json as List).map((e) => InboxData.fromJson(e)).toList(),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
