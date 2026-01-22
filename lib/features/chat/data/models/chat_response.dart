import 'package:json_annotation/json_annotation.dart';
part 'chat_response.g.dart';


@JsonSerializable()
class ChatResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'is_success')
  final bool? isSuccess;
  @JsonKey(name: 'data')
  final dynamic data;

  ChatResponse({
    this.message,
    this.statusCode,
    this.isSuccess,
    this.data,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
