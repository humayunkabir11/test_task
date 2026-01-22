// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LastMessage {

@JsonKey(name: "content") String? get content;@JsonKey(name: "id") int? get id;@JsonKey(name: "conversation_id") int? get conversationId;@JsonKey(name: "sender_id") int? get senderId;@JsonKey(name: "created_at") DateTime? get createdAt;@JsonKey(name: "is_seen") bool? get isSeen;@JsonKey(name: "attachments") List<dynamic>? get attachments;
/// Create a copy of LastMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LastMessageCopyWith<LastMessage> get copyWith => _$LastMessageCopyWithImpl<LastMessage>(this as LastMessage, _$identity);

  /// Serializes this LastMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastMessage&&(identical(other.content, content) || other.content == content)&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isSeen, isSeen) || other.isSeen == isSeen)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,id,conversationId,senderId,createdAt,isSeen,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'LastMessage(content: $content, id: $id, conversationId: $conversationId, senderId: $senderId, createdAt: $createdAt, isSeen: $isSeen, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $LastMessageCopyWith<$Res>  {
  factory $LastMessageCopyWith(LastMessage value, $Res Function(LastMessage) _then) = _$LastMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "content") String? content,@JsonKey(name: "id") int? id,@JsonKey(name: "conversation_id") int? conversationId,@JsonKey(name: "sender_id") int? senderId,@JsonKey(name: "created_at") DateTime? createdAt,@JsonKey(name: "is_seen") bool? isSeen,@JsonKey(name: "attachments") List<dynamic>? attachments
});




}
/// @nodoc
class _$LastMessageCopyWithImpl<$Res>
    implements $LastMessageCopyWith<$Res> {
  _$LastMessageCopyWithImpl(this._self, this._then);

  final LastMessage _self;
  final $Res Function(LastMessage) _then;

/// Create a copy of LastMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = freezed,Object? id = freezed,Object? conversationId = freezed,Object? senderId = freezed,Object? createdAt = freezed,Object? isSeen = freezed,Object? attachments = freezed,}) {
  return _then(_self.copyWith(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSeen: freezed == isSeen ? _self.isSeen : isSeen // ignore: cast_nullable_to_non_nullable
as bool?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LastMessage].
extension LastMessagePatterns on LastMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LastMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LastMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LastMessage value)  $default,){
final _that = this;
switch (_that) {
case _LastMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LastMessage value)?  $default,){
final _that = this;
switch (_that) {
case _LastMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "content")  String? content, @JsonKey(name: "id")  int? id, @JsonKey(name: "conversation_id")  int? conversationId, @JsonKey(name: "sender_id")  int? senderId, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "is_seen")  bool? isSeen, @JsonKey(name: "attachments")  List<dynamic>? attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LastMessage() when $default != null:
return $default(_that.content,_that.id,_that.conversationId,_that.senderId,_that.createdAt,_that.isSeen,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "content")  String? content, @JsonKey(name: "id")  int? id, @JsonKey(name: "conversation_id")  int? conversationId, @JsonKey(name: "sender_id")  int? senderId, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "is_seen")  bool? isSeen, @JsonKey(name: "attachments")  List<dynamic>? attachments)  $default,) {final _that = this;
switch (_that) {
case _LastMessage():
return $default(_that.content,_that.id,_that.conversationId,_that.senderId,_that.createdAt,_that.isSeen,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "content")  String? content, @JsonKey(name: "id")  int? id, @JsonKey(name: "conversation_id")  int? conversationId, @JsonKey(name: "sender_id")  int? senderId, @JsonKey(name: "created_at")  DateTime? createdAt, @JsonKey(name: "is_seen")  bool? isSeen, @JsonKey(name: "attachments")  List<dynamic>? attachments)?  $default,) {final _that = this;
switch (_that) {
case _LastMessage() when $default != null:
return $default(_that.content,_that.id,_that.conversationId,_that.senderId,_that.createdAt,_that.isSeen,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LastMessage implements LastMessage {
  const _LastMessage({@JsonKey(name: "content") this.content, @JsonKey(name: "id") this.id, @JsonKey(name: "conversation_id") this.conversationId, @JsonKey(name: "sender_id") this.senderId, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "is_seen") this.isSeen, @JsonKey(name: "attachments") final  List<dynamic>? attachments}): _attachments = attachments;
  factory _LastMessage.fromJson(Map<String, dynamic> json) => _$LastMessageFromJson(json);

@override@JsonKey(name: "content") final  String? content;
@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "conversation_id") final  int? conversationId;
@override@JsonKey(name: "sender_id") final  int? senderId;
@override@JsonKey(name: "created_at") final  DateTime? createdAt;
@override@JsonKey(name: "is_seen") final  bool? isSeen;
 final  List<dynamic>? _attachments;
@override@JsonKey(name: "attachments") List<dynamic>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LastMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LastMessageCopyWith<_LastMessage> get copyWith => __$LastMessageCopyWithImpl<_LastMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LastMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LastMessage&&(identical(other.content, content) || other.content == content)&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isSeen, isSeen) || other.isSeen == isSeen)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,id,conversationId,senderId,createdAt,isSeen,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'LastMessage(content: $content, id: $id, conversationId: $conversationId, senderId: $senderId, createdAt: $createdAt, isSeen: $isSeen, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$LastMessageCopyWith<$Res> implements $LastMessageCopyWith<$Res> {
  factory _$LastMessageCopyWith(_LastMessage value, $Res Function(_LastMessage) _then) = __$LastMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "content") String? content,@JsonKey(name: "id") int? id,@JsonKey(name: "conversation_id") int? conversationId,@JsonKey(name: "sender_id") int? senderId,@JsonKey(name: "created_at") DateTime? createdAt,@JsonKey(name: "is_seen") bool? isSeen,@JsonKey(name: "attachments") List<dynamic>? attachments
});




}
/// @nodoc
class __$LastMessageCopyWithImpl<$Res>
    implements _$LastMessageCopyWith<$Res> {
  __$LastMessageCopyWithImpl(this._self, this._then);

  final _LastMessage _self;
  final $Res Function(_LastMessage) _then;

/// Create a copy of LastMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = freezed,Object? id = freezed,Object? conversationId = freezed,Object? senderId = freezed,Object? createdAt = freezed,Object? isSeen = freezed,Object? attachments = freezed,}) {
  return _then(_LastMessage(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSeen: freezed == isSeen ? _self.isSeen : isSeen // ignore: cast_nullable_to_non_nullable
as bool?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
