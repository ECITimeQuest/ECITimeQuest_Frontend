import 'package:freezed_annotation/freezed_annotation.dart';

part 'era_mastery_item_response.freezed.dart';
part 'era_mastery_item_response.g.dart';

@freezed
abstract class EraMasteryItemResponse with _$EraMasteryItemResponse {
  const factory EraMasteryItemResponse({
    @JsonKey(name: 'period_id') required String periodId,
    @JsonKey(name: 'period_name') required String periodName,
    @JsonKey(name: 'mastery_percentage') required double masteryPercentage,
    @JsonKey(name: 'topics_count') required int topicsCount,
    @JsonKey(name: 'topics_completed') required int topicsCompleted,
    @JsonKey(name: 'xp_total') required int xpTotal,
  }) = _EraMasteryItemResponse;

  factory EraMasteryItemResponse.fromJson(Map<String, dynamic> json) =>
      _$EraMasteryItemResponseFromJson(json);
}
