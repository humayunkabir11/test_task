// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => _LastMessage(
  content: json['content'] as String?,
  id: (json['id'] as num?)?.toInt(),
  conversationId: (json['conversation_id'] as num?)?.toInt(),
  senderId: (json['sender_id'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  isSeen: json['is_seen'] as bool?,
  attachments: json['attachments'] as List<dynamic>?,
);

Map<String, dynamic> _$LastMessageToJson(_LastMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'sender_id': instance.senderId,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_seen': instance.isSeen,
      'attachments': instance.attachments,
    };
