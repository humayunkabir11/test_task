// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InboxData _$InboxDataFromJson(Map<String, dynamic> json) => _InboxData(
  conversationId: (json['conversation_id'] as num?)?.toInt(),
  otherUser: json['other_user'] == null
      ? null
      : OtherUser.fromJson(json['other_user'] as Map<String, dynamic>),
  lastMessage: json['last_message'] == null
      ? null
      : LastMessage.fromJson(json['last_message'] as Map<String, dynamic>),
  unseenCount: (json['unseen_count'] as num?)?.toInt(),
  isOnline: json['is_online'] as bool?,
);

Map<String, dynamic> _$InboxDataToJson(_InboxData instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'other_user': instance.otherUser,
      'last_message': instance.lastMessage,
      'unseen_count': instance.unseenCount,
      'is_online': instance.isOnline,
    };
