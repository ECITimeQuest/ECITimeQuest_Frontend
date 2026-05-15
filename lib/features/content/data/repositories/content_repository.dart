import 'package:flutter_app/features/content/data/datasources/content_datasource.dart';
import 'package:flutter_app/features/content/data/models/responses/historical_period_response.dart';
import 'package:flutter_app/features/content/data/models/responses/topic_response.dart';
import 'package:flutter_app/features/content/data/models/responses/topic_ia_context_response.dart';

class ContentRepository {
  final ContentDataSource _contentDataSource;

  ContentRepository(this._contentDataSource);

  Future<TopicAIContextResponse> getIAContext(String topicId) {
    return _contentDataSource.getIAContext(topicId);
  }

  Future<List<HistoricalPeriodResponse>> listPeriods() {
    return _contentDataSource.listPeriods();
  }

  Future<HistoricalPeriodResponse> getPeriod(String periodId) {
    return _contentDataSource.getPeriod(periodId);
  }

  Future<List<TopicResponse>> listTopics(String periodId) {
    return _contentDataSource.listTopics(periodId);
  }

  Future<TopicResponse> getTopic(String topicId) {
    return _contentDataSource.getTopic(topicId);
  }
}
