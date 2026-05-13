// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProgressResponse {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'xp_total') int get xpTotal; int get level; int get coins; int get lives;@JsonKey(name: 'lives_refill_at') DateTime? get livesRefillAt;@JsonKey(name: 'streak_day') int get streakDay;@JsonKey(name: 'longest_streak') int get longestStreak;@JsonKey(name: 'last_activity_date') DateTime? get lastActivityDate;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of UserProgressResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProgressResponseCopyWith<UserProgressResponse> get copyWith => _$UserProgressResponseCopyWithImpl<UserProgressResponse>(this as UserProgressResponse, _$identity);

  /// Serializes this UserProgressResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProgressResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.xpTotal, xpTotal) || other.xpTotal == xpTotal)&&(identical(other.level, level) || other.level == level)&&(identical(other.coins, coins) || other.coins == coins)&&(identical(other.lives, lives) || other.lives == lives)&&(identical(other.livesRefillAt, livesRefillAt) || other.livesRefillAt == livesRefillAt)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.lastActivityDate, lastActivityDate) || other.lastActivityDate == lastActivityDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,xpTotal,level,coins,lives,livesRefillAt,streakDay,longestStreak,lastActivityDate,updatedAt);

@override
String toString() {
  return 'UserProgressResponse(id: $id, userId: $userId, xpTotal: $xpTotal, level: $level, coins: $coins, lives: $lives, livesRefillAt: $livesRefillAt, streakDay: $streakDay, longestStreak: $longestStreak, lastActivityDate: $lastActivityDate, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserProgressResponseCopyWith<$Res>  {
  factory $UserProgressResponseCopyWith(UserProgressResponse value, $Res Function(UserProgressResponse) _then) = _$UserProgressResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'xp_total') int xpTotal, int level, int coins, int lives,@JsonKey(name: 'lives_refill_at') DateTime? livesRefillAt,@JsonKey(name: 'streak_day') int streakDay,@JsonKey(name: 'longest_streak') int longestStreak,@JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$UserProgressResponseCopyWithImpl<$Res>
    implements $UserProgressResponseCopyWith<$Res> {
  _$UserProgressResponseCopyWithImpl(this._self, this._then);

  final UserProgressResponse _self;
  final $Res Function(UserProgressResponse) _then;

/// Create a copy of UserProgressResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? xpTotal = null,Object? level = null,Object? coins = null,Object? lives = null,Object? livesRefillAt = freezed,Object? streakDay = null,Object? longestStreak = null,Object? lastActivityDate = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,xpTotal: null == xpTotal ? _self.xpTotal : xpTotal // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as int,lives: null == lives ? _self.lives : lives // ignore: cast_nullable_to_non_nullable
as int,livesRefillAt: freezed == livesRefillAt ? _self.livesRefillAt : livesRefillAt // ignore: cast_nullable_to_non_nullable
as DateTime?,streakDay: null == streakDay ? _self.streakDay : streakDay // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,lastActivityDate: freezed == lastActivityDate ? _self.lastActivityDate : lastActivityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProgressResponse].
extension UserProgressResponsePatterns on UserProgressResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProgressResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProgressResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProgressResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserProgressResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProgressResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserProgressResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'xp_total')  int xpTotal,  int level,  int coins,  int lives, @JsonKey(name: 'lives_refill_at')  DateTime? livesRefillAt, @JsonKey(name: 'streak_day')  int streakDay, @JsonKey(name: 'longest_streak')  int longestStreak, @JsonKey(name: 'last_activity_date')  DateTime? lastActivityDate, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProgressResponse() when $default != null:
return $default(_that.id,_that.userId,_that.xpTotal,_that.level,_that.coins,_that.lives,_that.livesRefillAt,_that.streakDay,_that.longestStreak,_that.lastActivityDate,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'xp_total')  int xpTotal,  int level,  int coins,  int lives, @JsonKey(name: 'lives_refill_at')  DateTime? livesRefillAt, @JsonKey(name: 'streak_day')  int streakDay, @JsonKey(name: 'longest_streak')  int longestStreak, @JsonKey(name: 'last_activity_date')  DateTime? lastActivityDate, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserProgressResponse():
return $default(_that.id,_that.userId,_that.xpTotal,_that.level,_that.coins,_that.lives,_that.livesRefillAt,_that.streakDay,_that.longestStreak,_that.lastActivityDate,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'xp_total')  int xpTotal,  int level,  int coins,  int lives, @JsonKey(name: 'lives_refill_at')  DateTime? livesRefillAt, @JsonKey(name: 'streak_day')  int streakDay, @JsonKey(name: 'longest_streak')  int longestStreak, @JsonKey(name: 'last_activity_date')  DateTime? lastActivityDate, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProgressResponse() when $default != null:
return $default(_that.id,_that.userId,_that.xpTotal,_that.level,_that.coins,_that.lives,_that.livesRefillAt,_that.streakDay,_that.longestStreak,_that.lastActivityDate,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProgressResponse implements UserProgressResponse {
  const _UserProgressResponse({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'xp_total') required this.xpTotal, required this.level, required this.coins, required this.lives, @JsonKey(name: 'lives_refill_at') this.livesRefillAt, @JsonKey(name: 'streak_day') required this.streakDay, @JsonKey(name: 'longest_streak') required this.longestStreak, @JsonKey(name: 'last_activity_date') this.lastActivityDate, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _UserProgressResponse.fromJson(Map<String, dynamic> json) => _$UserProgressResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'xp_total') final  int xpTotal;
@override final  int level;
@override final  int coins;
@override final  int lives;
@override@JsonKey(name: 'lives_refill_at') final  DateTime? livesRefillAt;
@override@JsonKey(name: 'streak_day') final  int streakDay;
@override@JsonKey(name: 'longest_streak') final  int longestStreak;
@override@JsonKey(name: 'last_activity_date') final  DateTime? lastActivityDate;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of UserProgressResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProgressResponseCopyWith<_UserProgressResponse> get copyWith => __$UserProgressResponseCopyWithImpl<_UserProgressResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProgressResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProgressResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.xpTotal, xpTotal) || other.xpTotal == xpTotal)&&(identical(other.level, level) || other.level == level)&&(identical(other.coins, coins) || other.coins == coins)&&(identical(other.lives, lives) || other.lives == lives)&&(identical(other.livesRefillAt, livesRefillAt) || other.livesRefillAt == livesRefillAt)&&(identical(other.streakDay, streakDay) || other.streakDay == streakDay)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.lastActivityDate, lastActivityDate) || other.lastActivityDate == lastActivityDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,xpTotal,level,coins,lives,livesRefillAt,streakDay,longestStreak,lastActivityDate,updatedAt);

@override
String toString() {
  return 'UserProgressResponse(id: $id, userId: $userId, xpTotal: $xpTotal, level: $level, coins: $coins, lives: $lives, livesRefillAt: $livesRefillAt, streakDay: $streakDay, longestStreak: $longestStreak, lastActivityDate: $lastActivityDate, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProgressResponseCopyWith<$Res> implements $UserProgressResponseCopyWith<$Res> {
  factory _$UserProgressResponseCopyWith(_UserProgressResponse value, $Res Function(_UserProgressResponse) _then) = __$UserProgressResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'xp_total') int xpTotal, int level, int coins, int lives,@JsonKey(name: 'lives_refill_at') DateTime? livesRefillAt,@JsonKey(name: 'streak_day') int streakDay,@JsonKey(name: 'longest_streak') int longestStreak,@JsonKey(name: 'last_activity_date') DateTime? lastActivityDate,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$UserProgressResponseCopyWithImpl<$Res>
    implements _$UserProgressResponseCopyWith<$Res> {
  __$UserProgressResponseCopyWithImpl(this._self, this._then);

  final _UserProgressResponse _self;
  final $Res Function(_UserProgressResponse) _then;

/// Create a copy of UserProgressResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? xpTotal = null,Object? level = null,Object? coins = null,Object? lives = null,Object? livesRefillAt = freezed,Object? streakDay = null,Object? longestStreak = null,Object? lastActivityDate = freezed,Object? updatedAt = null,}) {
  return _then(_UserProgressResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,xpTotal: null == xpTotal ? _self.xpTotal : xpTotal // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as int,lives: null == lives ? _self.lives : lives // ignore: cast_nullable_to_non_nullable
as int,livesRefillAt: freezed == livesRefillAt ? _self.livesRefillAt : livesRefillAt // ignore: cast_nullable_to_non_nullable
as DateTime?,streakDay: null == streakDay ? _self.streakDay : streakDay // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,lastActivityDate: freezed == lastActivityDate ? _self.lastActivityDate : lastActivityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
