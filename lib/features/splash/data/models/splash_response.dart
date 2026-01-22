import 'package:json_annotation/json_annotation.dart';
part 'splash_response.g.dart';


@JsonSerializable()
class SplashResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'is_success')
  final bool? isSuccess;
  @JsonKey(name: 'data')
  final dynamic data;

  SplashResponse({
    this.message,
    this.statusCode,
    this.isSuccess,
    this.data,
  });

  factory SplashResponse.fromJson(Map<String, dynamic> json) =>
      _$SplashResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SplashResponseToJson(this);
}
