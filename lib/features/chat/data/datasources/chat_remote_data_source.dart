

import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/config/strings/api_endpoint.dart';
import '../../../../core/network/api_response.dart';
import '../../domain/usecase/chat_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class ChatRemoteDataSource {

}

class ChatRemoteSourceImpl implements ChatRemoteDataSource {
  final ApiClient apiClient;
  ChatRemoteSourceImpl({required this.apiClient});



}
