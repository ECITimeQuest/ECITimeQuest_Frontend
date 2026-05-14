// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeSummaryEraResponse {

@JsonKey(name: 'period_id') String get periodId;@JsonKey(name: 'period_name') String get periodName;@JsonKey(name: 'last_studied_at') DateTime get lastStudiedAt;@JsonKey(name: 'completion_percentage') double get completionPercentage;
/// Create a copy of HomeSummaryEraResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSummaryEraResponseCopyWith<HomeSummaryEraResponse> get copyWith => _$HomeSummaryEraResponseCopyWithImpl<HomeSummaryEraResponse>(this as HomeSummaryEraResponse, _$identity);

  /// Serializes this HomeSummaryEraResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSummaryEraResponse&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.periodName, periodName) || other.periodName == periodName)&&(identical(other.lastStudiedAt, lastStudiedAt) || other.lastStudiedAt == lastStudiedAt)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,periodName,lastStudiedAt,completionPercentage);

@override
String toString() {
  return 'HomeSummaryEraResponse(periodId: $periodId, periodName: $periodName, lastStudiedAt: $lastStudiedAt, completionPercentage: $completionPercentage)';
}


}

/// @nodoc
abstract mixin class $HomeSummaryEraResponseCopyWith<$Res>  {
  factory $HomeSummaryEraResponseCopyWith(HomeSummaryEraResponse value, $Res Function(HomeSummaryEraResponse) _then) = _$HomeSummaryEraResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'period_id') String periodId,@JsonKey(name: 'period_name') String periodName,@JsonKey(name: 'last_studied_at') DateTime lastStudiedAt,@JsonKey(name: 'completion_percentage') double completionPercentage
});




}
/// @nodoc
class _$HomeSummaryEraResponseCopyWithImpl<$Res>
    implements $HomeSummaryEraResponseCopyWith<$Res> {
  _$HomeSummaryEraResponseCopyWithImpl(this._self, this._then);

  final HomeSummaryEraResponse _self;
  final $Res Function(HomeSummaryEraResponse) _then;

/// Create a copy of HomeSummaryEraResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? periodId = null,Object? periodName = null,Object? lastStudiedAt = null,Object? completionPercentage = null,}) {
  return _then(_self.copyWith(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,periodName: null == periodName ? _self.periodName : periodName // ignore: cast_nullable_to_non_nullable
as String,lastStudiedAt: null == lastStudiedAt ? _self.lastStudiedAt : lastStudiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSummaryEraResponse].
extension HomeSummaryEraResponsePatterns on HomeSummaryEraResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSummaryEraResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSummaryEraResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSummaryEraResponse value)  $default,){
final _that = this;
switch (_that) {
case _HomeSummaryEraResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSummaryEraResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSummaryEraResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'period_id')  String periodId, @JsonKey(name: 'period_name')  String periodName, @JsonKey(name: 'last_studied_at')  DateTime lastStudiedAt, @JsonKey(name: 'completion_percentage')  double completionPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSummaryEraResponse() when $default != null:
return $default(_that.periodId,_that.periodName,_that.lastStudiedAt,_that.completionPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'period_id')  String periodId, @JsonKey(name: 'period_name')  String periodName, @JsonKey(name: 'last_studied_at')  DateTime lastStudiedAt, @JsonKey(name: 'completion_percentage')  double completionPercentage)  $default,) {final _that = this;
switch (_that) {
case _HomeSummaryEraResponse():
return $default(_that.periodId,_that.periodName,_that.lastStudiedAt,_that.completionPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'period_id')  String periodId, @JsonKey(name: 'period_name')  String periodName, @JsonKey(name: 'last_studied_at')  DateTime lastStudiedAt, @JsonKey(name: 'completion_percentage')  double completionPercentage)?  $default,) {final _that = this;
switch (_that) {
case _HomeSummaryEraResponse() when $default != null:
return $default(_that.periodId,_that.periodName,_that.lastStudiedAt,_that.completionPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSummaryEraResponse implements HomeSummaryEraResponse {
  const _HomeSummaryEraResponse({@JsonKey(name: 'period_id') required this.periodId, @JsonKey(name: 'period_name') required this.periodName, @JsonKey(name: 'last_studied_at') required this.lastStudiedAt, @JsonKey(name: 'completion_percentage') required this.completionPercentage});
  factory _HomeSummaryEraResponse.fromJson(Map<String, dynamic> json) => _$HomeSummaryEraResponseFromJson(json);

@override@JsonKey(name: 'period_id') final  String periodId;
@override@JsonKey(name: 'period_name') final  String periodName;
@override@JsonKey(name: 'last_studied_at') final  DateTime lastStudiedAt;
@override@JsonKey(name: 'completion_percentage') final  double completionPercentage;

/// Create a copy of HomeSummaryEraResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSummaryEraResponseCopyWith<_HomeSummaryEraResponse> get copyWith => __$HomeSummaryEraResponseCopyWithImpl<_HomeSummaryEraResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSummaryEraResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSummaryEraResponse&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.periodName, periodName) || other.periodName == periodName)&&(identical(other.lastStudiedAt, lastStudiedAt) || other.lastStudiedAt == lastStudiedAt)&&(identical(other.completionPercentage, completionPercentage) || other.completionPercentage == completionPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,periodName,lastStudiedAt,completionPercentage);

@override
String toString() {
  return 'HomeSummaryEraResponse(periodId: $periodId, periodName: $periodName, lastStudiedAt: $lastStudiedAt, completionPercentage: $completionPercentage)';
}


}

/// @nodoc
abstract mixin class _$HomeSummaryEraResponseCopyWith<$Res> implements $HomeSummaryEraResponseCopyWith<$Res> {
  factory _$HomeSummaryEraResponseCopyWith(_HomeSummaryEraResponse value, $Res Function(_HomeSummaryEraResponse) _then) = __$HomeSummaryEraResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'period_id') String periodId,@JsonKey(name: 'period_name') String periodName,@JsonKey(name: 'last_studied_at') DateTime lastStudiedAt,@JsonKey(name: 'completion_percentage') double completionPercentage
});




}
/// @nodoc
class __$HomeSummaryEraResponseCopyWithImpl<$Res>
    implements _$HomeSummaryEraResponseCopyWith<$Res> {
  __$HomeSummaryEraResponseCopyWithImpl(this._self, this._then);

  final _HomeSummaryEraResponse _self;
  final $Res Function(_HomeSummaryEraResponse) _then;

/// Create a copy of HomeSummaryEraResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? periodId = null,Object? periodName = null,Object? lastStudiedAt = null,Object? completionPercentage = null,}) {
  return _then(_HomeSummaryEraResponse(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,periodName: null == periodName ? _self.periodName : periodName // ignore: cast_nullable_to_non_nullable
as String,lastStudiedAt: null == lastStudiedAt ? _self.lastStudiedAt : lastStudiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completionPercentage: null == completionPercentage ? _self.completionPercentage : completionPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$HomeSummaryResponse {

@JsonKey(name: 'last_studied_era') HomeSummaryEraResponse? get lastStudiedEra;@JsonKey(name: 'completed_eras_count') int get completedErasCount;@JsonKey(name: 'total_eras_count') int get totalErasCount;
/// Create a copy of HomeSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSummaryResponseCopyWith<HomeSummaryResponse> get copyWith => _$HomeSummaryResponseCopyWithImpl<HomeSummaryResponse>(this as HomeSummaryResponse, _$identity);

  /// Serializes this HomeSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSummaryResponse&&(identical(other.lastStudiedEra, lastStudiedEra) || other.lastStudiedEra == lastStudiedEra)&&(identical(other.completedErasCount, completedErasCount) || other.completedErasCount == completedErasCount)&&(identical(other.totalErasCount, totalErasCount) || other.totalErasCount == totalErasCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastStudiedEra,completedErasCount,totalErasCount);

@override
String toString() {
  return 'HomeSummaryResponse(lastStudiedEra: $lastStudiedEra, completedErasCount: $completedErasCount, totalErasCount: $totalErasCount)';
}


}

/// @nodoc
abstract mixin class $HomeSummaryResponseCopyWith<$Res>  {
  factory $HomeSummaryResponseCopyWith(HomeSummaryResponse value, $Res Function(HomeSummaryResponse) _then) = _$HomeSummaryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'last_studied_era') HomeSummaryEraResponse? lastStudiedEra,@JsonKey(name: 'completed_eras_count') int completedErasCount,@JsonKey(name: 'total_eras_count') int totalErasCount
});


$HomeSummaryEraResponseCopyWith<$Res>? get lastStudiedEra;

}
/// @nodoc
class _$HomeSummaryResponseCopyWithImpl<$Res>
    implements $HomeSummaryResponseCopyWith<$Res> {
  _$HomeSummaryResponseCopyWithImpl(this._self, this._then);

  final HomeSummaryResponse _self;
  final $Res Function(HomeSummaryResponse) _then;

/// Create a copy of HomeSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastStudiedEra = freezed,Object? completedErasCount = null,Object? totalErasCount = null,}) {
  return _then(_self.copyWith(
lastStudiedEra: freezed == lastStudiedEra ? _self.lastStudiedEra : lastStudiedEra // ignore: cast_nullable_to_non_nullable
as HomeSummaryEraResponse?,completedErasCount: null == completedErasCount ? _self.completedErasCount : completedErasCount // ignore: cast_nullable_to_non_nullable
as int,totalErasCount: null == totalErasCount ? _self.totalErasCount : totalErasCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HomeSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSummaryEraResponseCopyWith<$Res>? get lastStudiedEra {
    if (_self.lastStudiedEra == null) {
    return null;
  }

  return $HomeSummaryEraResponseCopyWith<$Res>(_self.lastStudiedEra!, (value) {
    return _then(_self.copyWith(lastStudiedEra: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeSummaryResponse].
extension HomeSummaryResponsePatterns on HomeSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _HomeSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'last_studied_era')  HomeSummaryEraResponse? lastStudiedEra, @JsonKey(name: 'completed_eras_count')  int completedErasCount, @JsonKey(name: 'total_eras_count')  int totalErasCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSummaryResponse() when $default != null:
return $default(_that.lastStudiedEra,_that.completedErasCount,_that.totalErasCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'last_studied_era')  HomeSummaryEraResponse? lastStudiedEra, @JsonKey(name: 'completed_eras_count')  int completedErasCount, @JsonKey(name: 'total_eras_count')  int totalErasCount)  $default,) {final _that = this;
switch (_that) {
case _HomeSummaryResponse():
return $default(_that.lastStudiedEra,_that.completedErasCount,_that.totalErasCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'last_studied_era')  HomeSummaryEraResponse? lastStudiedEra, @JsonKey(name: 'completed_eras_count')  int completedErasCount, @JsonKey(name: 'total_eras_count')  int totalErasCount)?  $default,) {final _that = this;
switch (_that) {
case _HomeSummaryResponse() when $default != null:
return $default(_that.lastStudiedEra,_that.completedErasCount,_that.totalErasCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSummaryResponse implements HomeSummaryResponse {
  const _HomeSummaryResponse({@JsonKey(name: 'last_studied_era') this.lastStudiedEra, @JsonKey(name: 'completed_eras_count') required this.completedErasCount, @JsonKey(name: 'total_eras_count') required this.totalErasCount});
  factory _HomeSummaryResponse.fromJson(Map<String, dynamic> json) => _$HomeSummaryResponseFromJson(json);

@override@JsonKey(name: 'last_studied_era') final  HomeSummaryEraResponse? lastStudiedEra;
@override@JsonKey(name: 'completed_eras_count') final  int completedErasCount;
@override@JsonKey(name: 'total_eras_count') final  int totalErasCount;

/// Create a copy of HomeSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSummaryResponseCopyWith<_HomeSummaryResponse> get copyWith => __$HomeSummaryResponseCopyWithImpl<_HomeSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSummaryResponse&&(identical(other.lastStudiedEra, lastStudiedEra) || other.lastStudiedEra == lastStudiedEra)&&(identical(other.completedErasCount, completedErasCount) || other.completedErasCount == completedErasCount)&&(identical(other.totalErasCount, totalErasCount) || other.totalErasCount == totalErasCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastStudiedEra,completedErasCount,totalErasCount);

@override
String toString() {
  return 'HomeSummaryResponse(lastStudiedEra: $lastStudiedEra, completedErasCount: $completedErasCount, totalErasCount: $totalErasCount)';
}


}

/// @nodoc
abstract mixin class _$HomeSummaryResponseCopyWith<$Res> implements $HomeSummaryResponseCopyWith<$Res> {
  factory _$HomeSummaryResponseCopyWith(_HomeSummaryResponse value, $Res Function(_HomeSummaryResponse) _then) = __$HomeSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'last_studied_era') HomeSummaryEraResponse? lastStudiedEra,@JsonKey(name: 'completed_eras_count') int completedErasCount,@JsonKey(name: 'total_eras_count') int totalErasCount
});


@override $HomeSummaryEraResponseCopyWith<$Res>? get lastStudiedEra;

}
/// @nodoc
class __$HomeSummaryResponseCopyWithImpl<$Res>
    implements _$HomeSummaryResponseCopyWith<$Res> {
  __$HomeSummaryResponseCopyWithImpl(this._self, this._then);

  final _HomeSummaryResponse _self;
  final $Res Function(_HomeSummaryResponse) _then;

/// Create a copy of HomeSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastStudiedEra = freezed,Object? completedErasCount = null,Object? totalErasCount = null,}) {
  return _then(_HomeSummaryResponse(
lastStudiedEra: freezed == lastStudiedEra ? _self.lastStudiedEra : lastStudiedEra // ignore: cast_nullable_to_non_nullable
as HomeSummaryEraResponse?,completedErasCount: null == completedErasCount ? _self.completedErasCount : completedErasCount // ignore: cast_nullable_to_non_nullable
as int,totalErasCount: null == totalErasCount ? _self.totalErasCount : totalErasCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSummaryEraResponseCopyWith<$Res>? get lastStudiedEra {
    if (_self.lastStudiedEra == null) {
    return null;
  }

  return $HomeSummaryEraResponseCopyWith<$Res>(_self.lastStudiedEra!, (value) {
    return _then(_self.copyWith(lastStudiedEra: value));
  });
}
}

// dart format on
