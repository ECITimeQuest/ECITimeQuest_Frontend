import 'package:dio/dio.dart';
import 'package:flutter_app/core/network/api_config.dart';
import 'package:flutter_app/core/network/api_exception.dart';
import 'package:flutter_app/core/network/dio_exception_mapper.dart';
import 'package:flutter_app/features/learning/data/models/responses/topic_ia_context_response.dart';

class ContentDataSource {
  final Dio _dio;
  final DioExceptionMapper _exceptionMapper;

  ContentDataSource(this._dio, {DioExceptionMapper? exceptionMapper})
    : _exceptionMapper = exceptionMapper ?? const DioExceptionMapper();

  Future<TopicAIContextResponse> getIAContext(String topicId) async {
    try {
      final response = await _dio.get(ApiConfig.getIAContext(topicId));
      return _parseTopicAIContextResponse(response.data);
    } on DioException catch (e) {
      throw _exceptionMapper.map(e);
    }
  }

  TopicAIContextResponse _parseTopicAIContextResponse(
    Map<String, dynamic>? data,
  ) {
    if (data == null) {
      throw const ApiException(message: 'Empty response body');
    }

    return TopicAIContextResponse.fromJson(data);
  }
}
