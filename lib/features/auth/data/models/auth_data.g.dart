// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthData _$AuthDataFromJson(Map<String, dynamic> json) => _AuthData(
  accessToken: json['access_token'] as String?,
  accessTokenExpiresAt: (json['access_token_expires_at'] as num?)?.toInt(),
  refreshToken: json['refresh_token'] as String?,
  refreshTokenExpiresAt: (json['refresh_token_expires_at'] as num?)?.toInt(),
  tokenType: json['token_type'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$AuthDataToJson(_AuthData instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'access_token_expires_at': instance.accessTokenExpiresAt,
  'refresh_token': instance.refreshToken,
  'refresh_token_expires_at': instance.refreshTokenExpiresAt,
  'token_type': instance.tokenType,
  'role': instance.role,
};
