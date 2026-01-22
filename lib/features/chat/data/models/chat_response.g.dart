// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
  message: json['message'] as String?,
  statusCode: (json['status_code'] as num?)?.toInt(),
  isSuccess: json['is_success'] as bool?,
  data: json['data'],
);

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'is_success': instance.isSuccess,
      'data': instance.data,
    };
