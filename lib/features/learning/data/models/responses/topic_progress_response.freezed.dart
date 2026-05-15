// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_progress_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicProgressResponse {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'topic_id') String get topicId;@JsonKey(name: 'completion_percentage') double get completionPercentage;@JsonKey(name: 'xp_earned') int get xpEarned;@JsonKey(name: 'last_studied_at') DateTime? get lastStudiedAt;
/// Create a copy of TopicProgressResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicProgressResponseCopyWith<TopicProgressResponse> get copyWith => _$TopicProgressResponseCopyWithImpl<TopicProgressResponse>(this as TopicProgressResponse, _$identity);

  /// Serializes this TopicProgressResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicProgressResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage)&&(identical(other.xpEarned, xpEarned) || other.xpEarned == xpEarned)&&(identical(other.lastStudiedAt, lastStudiedAt) || other.lastStudiedAt == lastStudiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,completionPercentage,xpEarned,lastStudiedAt);

@override
String toString() {
  return 'TopicProgressResponse(id: $id, userId: $userId, topicId: $topicId, completionPercentage: $completionPercentage, xpEarned: $xpEarned, lastStudiedAt: $lastStudiedAt)';
}


}

/// @nodoc
abstract mixin class $TopicProgressResponseCopyWith<$Res>  {
  factory $TopicProgressResponseCopyWith(TopicProgressResponse value, $Res Function(TopicProgressResponse) _then) = _$TopicProgressResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') String topicId,@JsonKey(name: 'completion_percentage') double completionPercentage,@JsonKey(name: 'xp_earned') int xpEarned,@JsonKey(name: 'last_studied_at') DateTime? lastStudiedAt
});




}
/// @nodoc
class _$TopicProgressResponseCopyWithImpl<$Res>
    implements $TopicProgressResponseCopyWith<$Res> {
  _$TopicProgressResponseCopyWithImpl(this._self, this._then);

  final TopicProgressResponse _self;
  final $Res Function(TopicProgressResponse) _then;

/// Create a copy of TopicProgressResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? topicId = null,Object? completionPercentage = null,Object? xpEarned = null,Object? lastStudiedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as double,xpEarned: null == xpEarned ? _self.xpEarned : xpEarned // ignore: cast_nullable_to_non_nullable
as int,lastStudiedAt: freezed == lastStudiedAt ? _self.lastStudiedAt : lastStudiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicProgressResponse].
extension TopicProgressResponsePatterns on TopicProgressResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicProgressResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicProgressResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicProgressResponse value)  $default,){
final _that = this;
switch (_that) {
case _TopicProgressResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicProgressResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TopicProgressResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  String topicId, @JsonKey(name: 'completion_percentage')  double completionPercentage, @JsonKey(name: 'xp_earned')  int xpEarned, @JsonKey(name: 'last_studied_at')  DateTime? lastStudiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicProgressResponse() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.completionPercentage,_that.xpEarned,_that.lastStudiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  String topicId, @JsonKey(name: 'completion_percentage')  double completionPercentage, @JsonKey(name: 'xp_earned')  int xpEarned, @JsonKey(name: 'last_studied_at')  DateTime? lastStudiedAt)  $default,) {final _that = this;
switch (_that) {
case _TopicProgressResponse():
return $default(_that.id,_that.userId,_that.topicId,_that.completionPercentage,_that.xpEarned,_that.lastStudiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  String topicId, @JsonKey(name: 'completion_percentage')  double completionPercentage, @JsonKey(name: 'xp_earned')  int xpEarned, @JsonKey(name: 'last_studied_at')  DateTime? lastStudiedAt)?  $default,) {final _that = this;
switch (_that) {
case _TopicProgressResponse() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.completionPercentage,_that.xpEarned,_that.lastStudiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicProgressResponse implements TopicProgressResponse {
  const _TopicProgressResponse({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'topic_id') required this.topicId, @JsonKey(name: 'completion_percentage') required this.completionPercentage, @JsonKey(name: 'xp_earned') required this.xpEarned, @JsonKey(name: 'last_studied_at') this.lastStudiedAt});
  factory _TopicProgressResponse.fromJson(Map<String, dynamic> json) => _$TopicProgressResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'topic_id') final  String topicId;
@override@JsonKey(name: 'completion_percentage') final  double completionPercentage;
@override@JsonKey(name: 'xp_earned') final  int xpEarned;
@override@JsonKey(name: 'last_studied_at') final  DateTime? lastStudiedAt;

/// Create a copy of TopicProgressResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicProgressResponseCopyWith<_TopicProgressResponse> get copyWith => __$TopicProgressResponseCopyWithImpl<_TopicProgressResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicProgressResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicProgressResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage)&&(identical(other.xpEarned, xpEarned) || other.xpEarned == xpEarned)&&(identical(other.lastStudiedAt, lastStudiedAt) || other.lastStudiedAt == lastStudiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,completionPercentage,xpEarned,lastStudiedAt);

@override
String toString() {
  return 'TopicProgressResponse(id: $id, userId: $userId, topicId: $topicId, completionPercentage: $completionPercentage, xpEarned: $xpEarned, lastStudiedAt: $lastStudiedAt)';
}


}

/// @nodoc
abstract mixin class _$TopicProgressResponseCopyWith<$Res> implements $TopicProgressResponseCopyWith<$Res> {
  factory _$TopicProgressResponseCopyWith(_TopicProgressResponse value, $Res Function(_TopicProgressResponse) _then) = __$TopicProgressResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') String topicId,@JsonKey(name: 'completion_percentage') double completionPercentage,@JsonKey(name: 'xp_earned') int xpEarned,@JsonKey(name: 'last_studied_at') DateTime? lastStudiedAt
});




}
/// @nodoc
class __$TopicProgressResponseCopyWithImpl<$Res>
    implements _$TopicProgressResponseCopyWith<$Res> {
  __$TopicProgressResponseCopyWithImpl(this._self, this._then);

  final _TopicProgressResponse _self;
  final $Res Function(_TopicProgressResponse) _then;

/// Create a copy of TopicProgressResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? topicId = null,Object? completionPercentage = null,Object? xpEarned = null,Object? lastStudiedAt = freezed,}) {
  return _then(_TopicProgressResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as double,xpEarned: null == xpEarned ? _self.xpEarned : xpEarned // ignore: cast_nullable_to_non_nullable
as int,lastStudiedAt: freezed == lastStudiedAt ? _self.lastStudiedAt : lastStudiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
