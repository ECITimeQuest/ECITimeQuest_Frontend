// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'era_mastery_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EraMasteryItemResponse {

@JsonKey(name: 'period_id') String get periodId;@JsonKey(name: 'period_name') String get periodName;@JsonKey(name: 'mastery_percentage') double get masteryPercentage;@JsonKey(name: 'topics_count') int get topicsCount;@JsonKey(name: 'topics_completed') int get topicsCompleted;@JsonKey(name: 'xp_total') int get xpTotal;
/// Create a copy of EraMasteryItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EraMasteryItemResponseCopyWith<EraMasteryItemResponse> get copyWith => _$EraMasteryItemResponseCopyWithImpl<EraMasteryItemResponse>(this as EraMasteryItemResponse, _$identity);

  /// Serializes this EraMasteryItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EraMasteryItemResponse&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.periodName, periodName) || other.periodName == periodName)&&(identical(other.masteryPercentage, masteryPercentage) || other.masteryPercentage == masteryPercentage)&&(identical(other.topicsCount, topicsCount) || other.topicsCount == topicsCount)&&(identical(other.topicsCompleted, topicsCompleted) || other.topicsCompleted == topicsCompleted)&&(identical(other.xpTotal, xpTotal) || other.xpTotal == xpTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,periodName,masteryPercentage,topicsCount,topicsCompleted,xpTotal);

@override
String toString() {
  return 'EraMasteryItemResponse(periodId: $periodId, periodName: $periodName, masteryPercentage: $masteryPercentage, topicsCount: $topicsCount, topicsCompleted: $topicsCompleted, xpTotal: $xpTotal)';
}


}

/// @nodoc
abstract mixin class $EraMasteryItemResponseCopyWith<$Res>  {
  factory $EraMasteryItemResponseCopyWith(EraMasteryItemResponse value, $Res Function(EraMasteryItemResponse) _then) = _$EraMasteryItemResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'period_id') String periodId,@JsonKey(name: 'period_name') String periodName,@JsonKey(name: 'mastery_percentage') double masteryPercentage,@JsonKey(name: 'topics_count') int topicsCount,@JsonKey(name: 'topics_completed') int topicsCompleted,@JsonKey(name: 'xp_total') int xpTotal
});




}
/// @nodoc
class _$EraMasteryItemResponseCopyWithImpl<$Res>
    implements $EraMasteryItemResponseCopyWith<$Res> {
  _$EraMasteryItemResponseCopyWithImpl(this._self, this._then);

  final EraMasteryItemResponse _self;
  final $Res Function(EraMasteryItemResponse) _then;

/// Create a copy of EraMasteryItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? periodId = null,Object? periodName = null,Object? masteryPercentage = null,Object? topicsCount = null,Object? topicsCompleted = null,Object? xpTotal = null,}) {
  return _then(_self.copyWith(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,periodName: null == periodName ? _self.periodName : periodName // ignore: cast_nullable_to_non_nullable
as String,masteryPercentage: null == masteryPercentage ? _self.masteryPercentage : masteryPercentage // ignore: cast_nullable_to_non_nullable
as double,topicsCount: null == topicsCount ? _self.topicsCount : topicsCount // ignore: cast_nullable_to_non_nullable
as int,topicsCompleted: null == topicsCompleted ? _self.topicsCompleted : topicsCompleted // ignore: cast_nullable_to_non_nullable
as int,xpTotal: null == xpTotal ? _self.xpTotal : xpTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EraMasteryItemResponse].
extension EraMasteryItemResponsePatterns on EraMasteryItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EraMasteryItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EraMasteryItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EraMasteryItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _EraMasteryItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EraMasteryItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EraMasteryItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'period_id')  String periodId, @JsonKey(name: 'period_name')  String periodName, @JsonKey(name: 'mastery_percentage')  double masteryPercentage, @JsonKey(name: 'topics_count')  int topicsCount, @JsonKey(name: 'topics_completed')  int topicsCompleted, @JsonKey(name: 'xp_total')  int xpTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EraMasteryItemResponse() when $default != null:
return $default(_that.periodId,_that.periodName,_that.masteryPercentage,_that.topicsCount,_that.topicsCompleted,_that.xpTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'period_id')  String periodId, @JsonKey(name: 'period_name')  String periodName, @JsonKey(name: 'mastery_percentage')  double masteryPercentage, @JsonKey(name: 'topics_count')  int topicsCount, @JsonKey(name: 'topics_completed')  int topicsCompleted, @JsonKey(name: 'xp_total')  int xpTotal)  $default,) {final _that = this;
switch (_that) {
case _EraMasteryItemResponse():
return $default(_that.periodId,_that.periodName,_that.masteryPercentage,_that.topicsCount,_that.topicsCompleted,_that.xpTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'period_id')  String periodId, @JsonKey(name: 'period_name')  String periodName, @JsonKey(name: 'mastery_percentage')  double masteryPercentage, @JsonKey(name: 'topics_count')  int topicsCount, @JsonKey(name: 'topics_completed')  int topicsCompleted, @JsonKey(name: 'xp_total')  int xpTotal)?  $default,) {final _that = this;
switch (_that) {
case _EraMasteryItemResponse() when $default != null:
return $default(_that.periodId,_that.periodName,_that.masteryPercentage,_that.topicsCount,_that.topicsCompleted,_that.xpTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EraMasteryItemResponse implements EraMasteryItemResponse {
  const _EraMasteryItemResponse({@JsonKey(name: 'period_id') required this.periodId, @JsonKey(name: 'period_name') required this.periodName, @JsonKey(name: 'mastery_percentage') required this.masteryPercentage, @JsonKey(name: 'topics_count') required this.topicsCount, @JsonKey(name: 'topics_completed') required this.topicsCompleted, @JsonKey(name: 'xp_total') required this.xpTotal});
  factory _EraMasteryItemResponse.fromJson(Map<String, dynamic> json) => _$EraMasteryItemResponseFromJson(json);

@override@JsonKey(name: 'period_id') final  String periodId;
@override@JsonKey(name: 'period_name') final  String periodName;
@override@JsonKey(name: 'mastery_percentage') final  double masteryPercentage;
@override@JsonKey(name: 'topics_count') final  int topicsCount;
@override@JsonKey(name: 'topics_completed') final  int topicsCompleted;
@override@JsonKey(name: 'xp_total') final  int xpTotal;

/// Create a copy of EraMasteryItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EraMasteryItemResponseCopyWith<_EraMasteryItemResponse> get copyWith => __$EraMasteryItemResponseCopyWithImpl<_EraMasteryItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EraMasteryItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EraMasteryItemResponse&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.periodName, periodName) || other.periodName == periodName)&&(identical(other.masteryPercentage, masteryPercentage) || other.masteryPercentage == masteryPercentage)&&(identical(other.topicsCount, topicsCount) || other.topicsCount == topicsCount)&&(identical(other.topicsCompleted, topicsCompleted) || other.topicsCompleted == topicsCompleted)&&(identical(other.xpTotal, xpTotal) || other.xpTotal == xpTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,periodName,masteryPercentage,topicsCount,topicsCompleted,xpTotal);

@override
String toString() {
  return 'EraMasteryItemResponse(periodId: $periodId, periodName: $periodName, masteryPercentage: $masteryPercentage, topicsCount: $topicsCount, topicsCompleted: $topicsCompleted, xpTotal: $xpTotal)';
}


}

/// @nodoc
abstract mixin class _$EraMasteryItemResponseCopyWith<$Res> implements $EraMasteryItemResponseCopyWith<$Res> {
  factory _$EraMasteryItemResponseCopyWith(_EraMasteryItemResponse value, $Res Function(_EraMasteryItemResponse) _then) = __$EraMasteryItemResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'period_id') String periodId,@JsonKey(name: 'period_name') String periodName,@JsonKey(name: 'mastery_percentage') double masteryPercentage,@JsonKey(name: 'topics_count') int topicsCount,@JsonKey(name: 'topics_completed') int topicsCompleted,@JsonKey(name: 'xp_total') int xpTotal
});




}
/// @nodoc
class __$EraMasteryItemResponseCopyWithImpl<$Res>
    implements _$EraMasteryItemResponseCopyWith<$Res> {
  __$EraMasteryItemResponseCopyWithImpl(this._self, this._then);

  final _EraMasteryItemResponse _self;
  final $Res Function(_EraMasteryItemResponse) _then;

/// Create a copy of EraMasteryItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? periodId = null,Object? periodName = null,Object? masteryPercentage = null,Object? topicsCount = null,Object? topicsCompleted = null,Object? xpTotal = null,}) {
  return _then(_EraMasteryItemResponse(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,periodName: null == periodName ? _self.periodName : periodName // ignore: cast_nullable_to_non_nullable
as String,masteryPercentage: null == masteryPercentage ? _self.masteryPercentage : masteryPercentage // ignore: cast_nullable_to_non_nullable
as double,topicsCount: null == topicsCount ? _self.topicsCount : topicsCount // ignore: cast_nullable_to_non_nullable
as int,topicsCompleted: null == topicsCompleted ? _self.topicsCompleted : topicsCompleted // ignore: cast_nullable_to_non_nullable
as int,xpTotal: null == xpTotal ? _self.xpTotal : xpTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
