import 'package:json_annotation/json_annotation.dart';
part 'home_response.g.dart';


@JsonSerializable()
class HomeResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'is_success')
  final bool? isSuccess;
  @JsonKey(name: 'data')
  final dynamic data;

  HomeResponse({
    this.message,
    this.statusCode,
    this.isSuccess,
    this.data,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
