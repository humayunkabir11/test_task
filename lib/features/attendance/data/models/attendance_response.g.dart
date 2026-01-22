// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) =>
    AttendanceResponse(
      message: json['message'] as String?,
      statusCode: (json['status_code'] as num?)?.toInt(),
      isSuccess: json['is_success'] as bool?,
      data: json['data'],
    );

Map<String, dynamic> _$AttendanceResponseToJson(AttendanceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'is_success': instance.isSuccess,
      'data': instance.data,
    };
