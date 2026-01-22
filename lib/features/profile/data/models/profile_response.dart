import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';


@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'is_success')
  final bool? isSuccess;
  @JsonKey(name: 'data')
  final dynamic data;

  ProfileResponse({
    this.message,
    this.statusCode,
    this.isSuccess,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
