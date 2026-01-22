// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtherUser {

@JsonKey(name: "id") int? get id;@JsonKey(name: "first_name") String? get firstName;@JsonKey(name: "last_name") String? get lastName;@JsonKey(name: "profile_image") String? get profileImage;@JsonKey(name: "role") String? get role;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of OtherUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherUserCopyWith<OtherUser> get copyWith => _$OtherUserCopyWithImpl<OtherUser>(this as OtherUser, _$identity);

  /// Serializes this OtherUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherUser&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,profileImage,role,isActive);

@override
String toString() {
  return 'OtherUser(id: $id, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $OtherUserCopyWith<$Res>  {
  factory $OtherUserCopyWith(OtherUser value, $Res Function(OtherUser) _then) = _$OtherUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "first_name") String? firstName,@JsonKey(name: "last_name") String? lastName,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "role") String? role,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class _$OtherUserCopyWithImpl<$Res>
    implements $OtherUserCopyWith<$Res> {
  _$OtherUserCopyWithImpl(this._self, this._then);

  final OtherUser _self;
  final $Res Function(OtherUser) _then;

/// Create a copy of OtherUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? profileImage = freezed,Object? role = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [OtherUser].
extension OtherUserPatterns on OtherUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtherUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtherUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtherUser value)  $default,){
final _that = this;
switch (_that) {
case _OtherUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtherUser value)?  $default,){
final _that = this;
switch (_that) {
case _OtherUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "role")  String? role, @JsonKey(name: "is_active")  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtherUser() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.profileImage,_that.role,_that.isActive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "role")  String? role, @JsonKey(name: "is_active")  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _OtherUser():
return $default(_that.id,_that.firstName,_that.lastName,_that.profileImage,_that.role,_that.isActive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "first_name")  String? firstName, @JsonKey(name: "last_name")  String? lastName, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "role")  String? role, @JsonKey(name: "is_active")  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _OtherUser() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.profileImage,_that.role,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtherUser implements OtherUser {
  const _OtherUser({@JsonKey(name: "id") this.id, @JsonKey(name: "first_name") this.firstName, @JsonKey(name: "last_name") this.lastName, @JsonKey(name: "profile_image") this.profileImage, @JsonKey(name: "role") this.role, @JsonKey(name: "is_active") this.isActive});
  factory _OtherUser.fromJson(Map<String, dynamic> json) => _$OtherUserFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "first_name") final  String? firstName;
@override@JsonKey(name: "last_name") final  String? lastName;
@override@JsonKey(name: "profile_image") final  String? profileImage;
@override@JsonKey(name: "role") final  String? role;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of OtherUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtherUserCopyWith<_OtherUser> get copyWith => __$OtherUserCopyWithImpl<_OtherUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtherUser&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,profileImage,role,isActive);

@override
String toString() {
  return 'OtherUser(id: $id, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$OtherUserCopyWith<$Res> implements $OtherUserCopyWith<$Res> {
  factory _$OtherUserCopyWith(_OtherUser value, $Res Function(_OtherUser) _then) = __$OtherUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "first_name") String? firstName,@JsonKey(name: "last_name") String? lastName,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "role") String? role,@JsonKey(name: "is_active") bool? isActive
});




}
/// @nodoc
class __$OtherUserCopyWithImpl<$Res>
    implements _$OtherUserCopyWith<$Res> {
  __$OtherUserCopyWithImpl(this._self, this._then);

  final _OtherUser _self;
  final $Res Function(_OtherUser) _then;

/// Create a copy of OtherUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? profileImage = freezed,Object? role = freezed,Object? isActive = freezed,}) {
  return _then(_OtherUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
