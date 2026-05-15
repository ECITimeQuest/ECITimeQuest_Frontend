// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concept_gap_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConceptGapResponse {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'topic_id') String get topicId;@JsonKey(name: 'topic_name') String? get topicName; String get concept;@JsonKey(name: 'error_type') ErrorType get errorType;@JsonKey(name: 'weakness_score') double get weaknessScore;@JsonKey(name: 'avg_response_time_ms') int? get avgResponseTimeMs;@JsonKey(name: 'detected_at') DateTime get detectedAt;
/// Create a copy of ConceptGapResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConceptGapResponseCopyWith<ConceptGapResponse> get copyWith => _$ConceptGapResponseCopyWithImpl<ConceptGapResponse>(this as ConceptGapResponse, _$identity);

  /// Serializes this ConceptGapResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConceptGapResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.concept, concept) || other.concept == concept)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.weaknessScore, weaknessScore) || other.weaknessScore == weaknessScore)&&(identical(other.avgResponseTimeMs, avgResponseTimeMs) || other.avgResponseTimeMs == avgResponseTimeMs)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,topicName,concept,errorType,weaknessScore,avgResponseTimeMs,detectedAt);

@override
String toString() {
  return 'ConceptGapResponse(id: $id, userId: $userId, topicId: $topicId, topicName: $topicName, concept: $concept, errorType: $errorType, weaknessScore: $weaknessScore, avgResponseTimeMs: $avgResponseTimeMs, detectedAt: $detectedAt)';
}


}

/// @nodoc
abstract mixin class $ConceptGapResponseCopyWith<$Res>  {
  factory $ConceptGapResponseCopyWith(ConceptGapResponse value, $Res Function(ConceptGapResponse) _then) = _$ConceptGapResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') String topicId,@JsonKey(name: 'topic_name') String? topicName, String concept,@JsonKey(name: 'error_type') ErrorType errorType,@JsonKey(name: 'weakness_score') double weaknessScore,@JsonKey(name: 'avg_response_time_ms') int? avgResponseTimeMs,@JsonKey(name: 'detected_at') DateTime detectedAt
});




}
/// @nodoc
class _$ConceptGapResponseCopyWithImpl<$Res>
    implements $ConceptGapResponseCopyWith<$Res> {
  _$ConceptGapResponseCopyWithImpl(this._self, this._then);

  final ConceptGapResponse _self;
  final $Res Function(ConceptGapResponse) _then;

/// Create a copy of ConceptGapResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? topicId = null,Object? topicName = freezed,Object? concept = null,Object? errorType = null,Object? weaknessScore = null,Object? avgResponseTimeMs = freezed,Object? detectedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,topicName: freezed == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String?,concept: null == concept ? _self.concept : concept // ignore: cast_nullable_to_non_nullable
as String,errorType: null == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as ErrorType,weaknessScore: null == weaknessScore ? _self.weaknessScore : weaknessScore // ignore: cast_nullable_to_non_nullable
as double,avgResponseTimeMs: freezed == avgResponseTimeMs ? _self.avgResponseTimeMs : avgResponseTimeMs // ignore: cast_nullable_to_non_nullable
as int?,detectedAt: null == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ConceptGapResponse].
extension ConceptGapResponsePatterns on ConceptGapResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConceptGapResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConceptGapResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConceptGapResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConceptGapResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConceptGapResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConceptGapResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  String topicId, @JsonKey(name: 'topic_name')  String? topicName,  String concept, @JsonKey(name: 'error_type')  ErrorType errorType, @JsonKey(name: 'weakness_score')  double weaknessScore, @JsonKey(name: 'avg_response_time_ms')  int? avgResponseTimeMs, @JsonKey(name: 'detected_at')  DateTime detectedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConceptGapResponse() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.topicName,_that.concept,_that.errorType,_that.weaknessScore,_that.avgResponseTimeMs,_that.detectedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  String topicId, @JsonKey(name: 'topic_name')  String? topicName,  String concept, @JsonKey(name: 'error_type')  ErrorType errorType, @JsonKey(name: 'weakness_score')  double weaknessScore, @JsonKey(name: 'avg_response_time_ms')  int? avgResponseTimeMs, @JsonKey(name: 'detected_at')  DateTime detectedAt)  $default,) {final _that = this;
switch (_that) {
case _ConceptGapResponse():
return $default(_that.id,_that.userId,_that.topicId,_that.topicName,_that.concept,_that.errorType,_that.weaknessScore,_that.avgResponseTimeMs,_that.detectedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  String topicId, @JsonKey(name: 'topic_name')  String? topicName,  String concept, @JsonKey(name: 'error_type')  ErrorType errorType, @JsonKey(name: 'weakness_score')  double weaknessScore, @JsonKey(name: 'avg_response_time_ms')  int? avgResponseTimeMs, @JsonKey(name: 'detected_at')  DateTime detectedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConceptGapResponse() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.topicName,_that.concept,_that.errorType,_that.weaknessScore,_that.avgResponseTimeMs,_that.detectedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConceptGapResponse implements ConceptGapResponse {
  const _ConceptGapResponse({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'topic_id') required this.topicId, @JsonKey(name: 'topic_name') this.topicName, required this.concept, @JsonKey(name: 'error_type') required this.errorType, @JsonKey(name: 'weakness_score') required this.weaknessScore, @JsonKey(name: 'avg_response_time_ms') this.avgResponseTimeMs, @JsonKey(name: 'detected_at') required this.detectedAt});
  factory _ConceptGapResponse.fromJson(Map<String, dynamic> json) => _$ConceptGapResponseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'topic_id') final  String topicId;
@override@JsonKey(name: 'topic_name') final  String? topicName;
@override final  String concept;
@override@JsonKey(name: 'error_type') final  ErrorType errorType;
@override@JsonKey(name: 'weakness_score') final  double weaknessScore;
@override@JsonKey(name: 'avg_response_time_ms') final  int? avgResponseTimeMs;
@override@JsonKey(name: 'detected_at') final  DateTime detectedAt;

/// Create a copy of ConceptGapResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConceptGapResponseCopyWith<_ConceptGapResponse> get copyWith => __$ConceptGapResponseCopyWithImpl<_ConceptGapResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConceptGapResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConceptGapResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.concept, concept) || other.concept == concept)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.weaknessScore, weaknessScore) || other.weaknessScore == weaknessScore)&&(identical(other.avgResponseTimeMs, avgResponseTimeMs) || other.avgResponseTimeMs == avgResponseTimeMs)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,topicName,concept,errorType,weaknessScore,avgResponseTimeMs,detectedAt);

@override
String toString() {
  return 'ConceptGapResponse(id: $id, userId: $userId, topicId: $topicId, topicName: $topicName, concept: $concept, errorType: $errorType, weaknessScore: $weaknessScore, avgResponseTimeMs: $avgResponseTimeMs, detectedAt: $detectedAt)';
}


}

/// @nodoc
abstract mixin class _$ConceptGapResponseCopyWith<$Res> implements $ConceptGapResponseCopyWith<$Res> {
  factory _$ConceptGapResponseCopyWith(_ConceptGapResponse value, $Res Function(_ConceptGapResponse) _then) = __$ConceptGapResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') String topicId,@JsonKey(name: 'topic_name') String? topicName, String concept,@JsonKey(name: 'error_type') ErrorType errorType,@JsonKey(name: 'weakness_score') double weaknessScore,@JsonKey(name: 'avg_response_time_ms') int? avgResponseTimeMs,@JsonKey(name: 'detected_at') DateTime detectedAt
});




}
/// @nodoc
class __$ConceptGapResponseCopyWithImpl<$Res>
    implements _$ConceptGapResponseCopyWith<$Res> {
  __$ConceptGapResponseCopyWithImpl(this._self, this._then);

  final _ConceptGapResponse _self;
  final $Res Function(_ConceptGapResponse) _then;

/// Create a copy of ConceptGapResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? topicId = null,Object? topicName = freezed,Object? concept = null,Object? errorType = null,Object? weaknessScore = null,Object? avgResponseTimeMs = freezed,Object? detectedAt = null,}) {
  return _then(_ConceptGapResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,topicName: freezed == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String?,concept: null == concept ? _self.concept : concept // ignore: cast_nullable_to_non_nullable
as String,errorType: null == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as ErrorType,weaknessScore: null == weaknessScore ? _self.weaknessScore : weaknessScore // ignore: cast_nullable_to_non_nullable
as double,avgResponseTimeMs: freezed == avgResponseTimeMs ? _self.avgResponseTimeMs : avgResponseTimeMs // ignore: cast_nullable_to_non_nullable
as int?,detectedAt: null == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
