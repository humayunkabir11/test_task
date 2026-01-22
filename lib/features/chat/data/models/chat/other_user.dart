import 'package:freezed_annotation/freezed_annotation.dart';
part 'other_user.freezed.dart';
part 'other_user.g.dart';

@freezed
abstract class OtherUser with _$OtherUser {
  const factory OtherUser({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "first_name")
    String? firstName,
    @JsonKey(name: "last_name")
    String? lastName,
    @JsonKey(name: "profile_image")
    String? profileImage,
    @JsonKey(name: "role")
    String? role,
    @JsonKey(name: "is_active")
    bool? isActive,
  }) = _OtherUser;

  factory OtherUser.fromJson(Map<String, dynamic> json) =>
      _$OtherUserFromJson(json);
}