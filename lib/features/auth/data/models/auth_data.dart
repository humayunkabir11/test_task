import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data.freezed.dart';
part 'auth_data.g.dart';


@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({
    @JsonKey(name: "access_token")
    String? accessToken,
    @JsonKey(name: "access_token_expires_at")
    int? accessTokenExpiresAt,
    @JsonKey(name: "refresh_token")
    String? refreshToken,
    @JsonKey(name: "refresh_token_expires_at")
    int? refreshTokenExpiresAt,
    @JsonKey(name: "token_type")
    String? tokenType,
    @JsonKey(name: "role")
    String? role,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);
}
