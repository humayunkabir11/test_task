import 'package:freezed_annotation/freezed_annotation.dart';

import 'last_message.dart';
import 'other_user.dart';

part 'inbox_data.freezed.dart';
part 'inbox_data.g.dart';


@freezed
abstract class InboxData with _$InboxData {
  const factory InboxData({
    @JsonKey(name: "conversation_id")
    int? conversationId,
    @JsonKey(name: "other_user")
    OtherUser? otherUser,
    @JsonKey(name: "last_message")
    LastMessage? lastMessage,
    @JsonKey(name: "unseen_count")
    int? unseenCount,
    @JsonKey(name: "is_online")
    bool? isOnline,
  }) = _InboxData;

  factory InboxData.fromJson(Map<String, dynamic> json) =>
      _$InboxDataFromJson(json);
}