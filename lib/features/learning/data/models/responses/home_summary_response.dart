import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_summary_response.freezed.dart';
part 'home_summary_response.g.dart';

@freezed
abstract class HomeSummaryEraResponse with _$HomeSummaryEraResponse {
  const factory HomeSummaryEraResponse({
    @JsonKey(name: 'period_id') required String periodId,
    @JsonKey(name: 'period_name') required String periodName,
    @JsonKey(name: 'last_studied_at') required DateTime lastStudiedAt,
    @JsonKey(name: 'completion_percentage')
    required double completionPercentage,
  }) = _HomeSummaryEraResponse;

  factory HomeSummaryEraResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeSummaryEraResponseFromJson(json);
}

@freezed
abstract class HomeSummaryResponse with _$HomeSummaryResponse {
  const factory HomeSummaryResponse({
    @JsonKey(name: 'last_studied_era') HomeSummaryEraResponse? lastStudiedEra,
    @JsonKey(name: 'completed_eras_count') required int completedErasCount,
    @JsonKey(name: 'total_eras_count') required int totalErasCount,
  }) = _HomeSummaryResponse;

  factory HomeSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeSummaryResponseFromJson(json);
}
