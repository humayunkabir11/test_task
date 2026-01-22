import 'package:json_annotation/json_annotation.dart';
part 'attendance_response.g.dart';


@JsonSerializable()
class AttendanceResponse {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'is_success')
  final bool? isSuccess;
  @JsonKey(name: 'data')
  final dynamic data;

  AttendanceResponse({
    this.message,
    this.statusCode,
    this.isSuccess,
    this.data,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResponseToJson(this);
}
