// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtherUser _$OtherUserFromJson(Map<String, dynamic> json) => _OtherUser(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  profileImage: json['profile_image'] as String?,
  role: json['role'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$OtherUserToJson(_OtherUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'role': instance.role,
      'is_active': instance.isActive,
    };
