// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InboxData {

@JsonKey(name: "conversation_id") int? get conversationId;@JsonKey(name: "other_user") OtherUser? get otherUser;@JsonKey(name: "last_message") LastMessage? get lastMessage;@JsonKey(name: "unseen_count") int? get unseenCount;@JsonKey(name: "is_online") bool? get isOnline;
/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxDataCopyWith<InboxData> get copyWith => _$InboxDataCopyWithImpl<InboxData>(this as InboxData, _$identity);

  /// Serializes this InboxData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxData&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.otherUser, otherUser) || other.otherUser == otherUser)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.unseenCount, unseenCount) || other.unseenCount == unseenCount)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId,otherUser,lastMessage,unseenCount,isOnline);

@override
String toString() {
  return 'InboxData(conversationId: $conversationId, otherUser: $otherUser, lastMessage: $lastMessage, unseenCount: $unseenCount, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class $InboxDataCopyWith<$Res>  {
  factory $InboxDataCopyWith(InboxData value, $Res Function(InboxData) _then) = _$InboxDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "conversation_id") int? conversationId,@JsonKey(name: "other_user") OtherUser? otherUser,@JsonKey(name: "last_message") LastMessage? lastMessage,@JsonKey(name: "unseen_count") int? unseenCount,@JsonKey(name: "is_online") bool? isOnline
});


$OtherUserCopyWith<$Res>? get otherUser;$LastMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$InboxDataCopyWithImpl<$Res>
    implements $InboxDataCopyWith<$Res> {
  _$InboxDataCopyWithImpl(this._self, this._then);

  final InboxData _self;
  final $Res Function(InboxData) _then;

/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = freezed,Object? otherUser = freezed,Object? lastMessage = freezed,Object? unseenCount = freezed,Object? isOnline = freezed,}) {
  return _then(_self.copyWith(
conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int?,otherUser: freezed == otherUser ? _self.otherUser : otherUser // ignore: cast_nullable_to_non_nullable
as OtherUser?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as LastMessage?,unseenCount: freezed == unseenCount ? _self.unseenCount : unseenCount // ignore: cast_nullable_to_non_nullable
as int?,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherUserCopyWith<$Res>? get otherUser {
    if (_self.otherUser == null) {
    return null;
  }

  return $OtherUserCopyWith<$Res>(_self.otherUser!, (value) {
    return _then(_self.copyWith(otherUser: value));
  });
}/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LastMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $LastMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [InboxData].
extension InboxDataPatterns on InboxData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxData value)  $default,){
final _that = this;
switch (_that) {
case _InboxData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxData value)?  $default,){
final _that = this;
switch (_that) {
case _InboxData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "conversation_id")  int? conversationId, @JsonKey(name: "other_user")  OtherUser? otherUser, @JsonKey(name: "last_message")  LastMessage? lastMessage, @JsonKey(name: "unseen_count")  int? unseenCount, @JsonKey(name: "is_online")  bool? isOnline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxData() when $default != null:
return $default(_that.conversationId,_that.otherUser,_that.lastMessage,_that.unseenCount,_that.isOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "conversation_id")  int? conversationId, @JsonKey(name: "other_user")  OtherUser? otherUser, @JsonKey(name: "last_message")  LastMessage? lastMessage, @JsonKey(name: "unseen_count")  int? unseenCount, @JsonKey(name: "is_online")  bool? isOnline)  $default,) {final _that = this;
switch (_that) {
case _InboxData():
return $default(_that.conversationId,_that.otherUser,_that.lastMessage,_that.unseenCount,_that.isOnline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "conversation_id")  int? conversationId, @JsonKey(name: "other_user")  OtherUser? otherUser, @JsonKey(name: "last_message")  LastMessage? lastMessage, @JsonKey(name: "unseen_count")  int? unseenCount, @JsonKey(name: "is_online")  bool? isOnline)?  $default,) {final _that = this;
switch (_that) {
case _InboxData() when $default != null:
return $default(_that.conversationId,_that.otherUser,_that.lastMessage,_that.unseenCount,_that.isOnline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InboxData implements InboxData {
  const _InboxData({@JsonKey(name: "conversation_id") this.conversationId, @JsonKey(name: "other_user") this.otherUser, @JsonKey(name: "last_message") this.lastMessage, @JsonKey(name: "unseen_count") this.unseenCount, @JsonKey(name: "is_online") this.isOnline});
  factory _InboxData.fromJson(Map<String, dynamic> json) => _$InboxDataFromJson(json);

@override@JsonKey(name: "conversation_id") final  int? conversationId;
@override@JsonKey(name: "other_user") final  OtherUser? otherUser;
@override@JsonKey(name: "last_message") final  LastMessage? lastMessage;
@override@JsonKey(name: "unseen_count") final  int? unseenCount;
@override@JsonKey(name: "is_online") final  bool? isOnline;

/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxDataCopyWith<_InboxData> get copyWith => __$InboxDataCopyWithImpl<_InboxData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxData&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.otherUser, otherUser) || other.otherUser == otherUser)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.unseenCount, unseenCount) || other.unseenCount == unseenCount)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId,otherUser,lastMessage,unseenCount,isOnline);

@override
String toString() {
  return 'InboxData(conversationId: $conversationId, otherUser: $otherUser, lastMessage: $lastMessage, unseenCount: $unseenCount, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$InboxDataCopyWith<$Res> implements $InboxDataCopyWith<$Res> {
  factory _$InboxDataCopyWith(_InboxData value, $Res Function(_InboxData) _then) = __$InboxDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "conversation_id") int? conversationId,@JsonKey(name: "other_user") OtherUser? otherUser,@JsonKey(name: "last_message") LastMessage? lastMessage,@JsonKey(name: "unseen_count") int? unseenCount,@JsonKey(name: "is_online") bool? isOnline
});


@override $OtherUserCopyWith<$Res>? get otherUser;@override $LastMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$InboxDataCopyWithImpl<$Res>
    implements _$InboxDataCopyWith<$Res> {
  __$InboxDataCopyWithImpl(this._self, this._then);

  final _InboxData _self;
  final $Res Function(_InboxData) _then;

/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = freezed,Object? otherUser = freezed,Object? lastMessage = freezed,Object? unseenCount = freezed,Object? isOnline = freezed,}) {
  return _then(_InboxData(
conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int?,otherUser: freezed == otherUser ? _self.otherUser : otherUser // ignore: cast_nullable_to_non_nullable
as OtherUser?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as LastMessage?,unseenCount: freezed == unseenCount ? _self.unseenCount : unseenCount // ignore: cast_nullable_to_non_nullable
as int?,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtherUserCopyWith<$Res>? get otherUser {
    if (_self.otherUser == null) {
    return null;
  }

  return $OtherUserCopyWith<$Res>(_self.otherUser!, (value) {
    return _then(_self.copyWith(otherUser: value));
  });
}/// Create a copy of InboxData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LastMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $LastMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
