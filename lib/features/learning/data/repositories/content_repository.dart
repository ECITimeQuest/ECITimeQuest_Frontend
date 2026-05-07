import 'package:flutter_app/features/learning/data/datasources/content_datasource.dart';
import 'package:flutter_app/features/learning/data/models/responses/topic_ia_context_response.dart';

class ContentRepository {
  final ContentDataSource _contentDataSource;

  ContentRepository(this._contentDataSource);

  Future<TopicAIContextResponse> getIAContext(String topicId) {
    return _contentDataSource.getIAContext(topicId);
  }
}
