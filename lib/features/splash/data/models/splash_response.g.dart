// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashResponse _$SplashResponseFromJson(Map<String, dynamic> json) =>
    SplashResponse(
      message: json['message'] as String?,
      statusCode: (json['status_code'] as num?)?.toInt(),
      isSuccess: json['is_success'] as bool?,
      data: json['data'],
    );

Map<String, dynamic> _$SplashResponseToJson(SplashResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'is_success': instance.isSuccess,
      'data': instance.data,
    };
