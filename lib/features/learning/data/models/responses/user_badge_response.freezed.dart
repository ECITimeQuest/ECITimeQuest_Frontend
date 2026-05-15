// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_badge_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBadgeResponse {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'badge_name') String get badgeName;@JsonKey(name: 'awarded_at') DateTime get awardedAt;
/// Create a copy of UserBadgeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBadgeResponseCopyWith<UserBadgeResponse> get copyWith => _$UserBadgeResponseCopyWithImpl<UserBadgeResponse>(this as UserBadgeResponse, _$identity);

  /// Serializes this UserBadgeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBadgeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.badgeName, badgeName) || other.badgeName == badgeName)&&(identical(other.awardedAt, awardedAt) || other.awardedAt == awardedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,badgeName,awardedAt);

@override
String toString() {
  return 'UserBadgeResponse(id: $id, userId: $userId, badgeName: $badgeName, awardedAt: $awardedAt)';
}


}

/// @nodoc
abstract mixin class $UserBadgeResponseCopyWith<$Res>  {
  factory $UserBadgeResponseCopyWith(UserBadgeResponse value, $Res Function(UserBadgeResponse) _then) = _$UserBadgeResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'badge_name') String badgeName,@JsonKey(name: 'awarded_at') DateTime awardedAt
});




}
/// @nodoc
class _$UserBadgeResponseCopyWithImpl<$Res>
    implements $UserBadgeResponseCopyWith<$Res> {
  _$UserBadgeResponseCopyWithImpl(this._self, this._then);

  final UserBadgeResponse _self;
  final $Res Function(UserBadgeResponse) _then;

/// Create a copy of UserBadgeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? badgeName = null,Object? awardedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,badgeName: null == badgeName ? _self.badgeName : badgeName // ignore: cast_nullable_to_non_nullable
as String,awardedAt: null == awardedAt ? _self.awardedAt : awardedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBadgeResponse].
extension UserBadgeResponsePatterns on UserBadgeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBadgeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBadgeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBadgeResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserBadgeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBadgeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserBadgeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'badge_name')  String badgeName, @JsonKey(name: 'awarded_at')  DateTime awardedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBadgeResponse() when $default != null:
return $default(_that.id,_that.userId,_that.badgeName,_that.awardedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'badge_name')  String badgeName, @JsonKey(name: 'awarded_at')  DateTime awardedAt)  $default,) {final _that = this;
switch (_that) {
case _UserBadgeResponse():
return $default(_that.id,_that.userId,_that.badgeName,_that.awardedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'badge_name')  String badgeName, @JsonKey(name: 'awarded_at')  DateTime awardedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserBadgeResponse() when $default != null:
return $default(_that.id,_that.userId,_that.badgeName,_that.awardedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserBadgeResponse implements UserBadgeResponse {
  const _UserBadgeResponse({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'badge_name') required this.badgeName, @JsonKey(name: 'awarded_at') required this.awardedAt});
  factory _UserBadgeResponse.fromJson(Map<String, dynamic> json) => _$UserBadgeResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'badge_name') final  String badgeName;
@override@JsonKey(name: 'awarded_at') final  DateTime awardedAt;

/// Create a copy of UserBadgeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBadgeResponseCopyWith<_UserBadgeResponse> get copyWith => __$UserBadgeResponseCopyWithImpl<_UserBadgeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBadgeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBadgeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.badgeName, badgeName) || other.badgeName == badgeName)&&(identical(other.awardedAt, awardedAt) || other.awardedAt == awardedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,badgeName,awardedAt);

@override
String toString() {
  return 'UserBadgeResponse(id: $id, userId: $userId, badgeName: $badgeName, awardedAt: $awardedAt)';
}


}

/// @nodoc
abstract mixin class _$UserBadgeResponseCopyWith<$Res> implements $UserBadgeResponseCopyWith<$Res> {
  factory _$UserBadgeResponseCopyWith(_UserBadgeResponse value, $Res Function(_UserBadgeResponse) _then) = __$UserBadgeResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'badge_name') String badgeName,@JsonKey(name: 'awarded_at') DateTime awardedAt
});




}
/// @nodoc
class __$UserBadgeResponseCopyWithImpl<$Res>
    implements _$UserBadgeResponseCopyWith<$Res> {
  __$UserBadgeResponseCopyWithImpl(this._self, this._then);

  final _UserBadgeResponse _self;
  final $Res Function(_UserBadgeResponse) _then;

/// Create a copy of UserBadgeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? badgeName = null,Object? awardedAt = null,}) {
  return _then(_UserBadgeResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,badgeName: null == badgeName ? _self.badgeName : badgeName // ignore: cast_nullable_to_non_nullable
as String,awardedAt: null == awardedAt ? _self.awardedAt : awardedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
