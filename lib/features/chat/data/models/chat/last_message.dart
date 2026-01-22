import 'package:freezed_annotation/freezed_annotation.dart';
part 'last_message.freezed.dart';
part 'last_message.g.dart';

@freezed
abstract class LastMessage with _$LastMessage {
  const factory LastMessage({
    @JsonKey(name: "content")
    String? content,
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "conversation_id")
    int? conversationId,
    @JsonKey(name: "sender_id")
    int? senderId,
    @JsonKey(name: "created_at")
    DateTime? createdAt,
    @JsonKey(name: "is_seen")
    bool? isSeen,
    @JsonKey(name: "attachments")
    List<dynamic>? attachments,
  }) = _LastMessage;

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);
}